#!/usr/bin/env bash
set -oue pipefail

META_FOLDER="/usr/share/ublue-os/meta"
ls -lah /usr/share/ublue-os/meta

get_json_array() {
    mapfile -t "${1}" < <(jq "${2}" "${META_FOLDER}/${3}")
}
get_json_string() {
    jq "${1}" "${META_FOLDER}/${2}"
}
FEDORA_VERSION="$(cat /usr/lib/os-release | grep '^VERSION_ID=' | head -1 | sed 's,^VERSION_ID=,,')"
BASE_IMAGE="$(get_json_string '."base-image"' 'metadata.json')"
YAFTI_ENABLED="$(get_json_string '.yafti' 'metadata.json')"
FIRSTBOOT_DATA="/usr/share/ublue-os/firstboot"
FIRSTBOOT_LINK="/usr/etc/profile.d/ublue-firstboot.sh"

echo "Building custom Fedora ${FEDORA_VERSION} from image: \"${BASE_IMAGE}\"."

run_scripts() {
    script_mode="$1"
    get_json_array buildscripts ".${script_mode}[]" 'scripts.json'
    if [[ ${#buildscripts[@]} -gt 0 ]]; then
        echo "-- Running [${script_mode}] scripts defined in recipe.yml --"
        for script in "${buildscripts[@]}"; do
            echo "Running [${script_mode}]: ${script}"
            "/tmp/scripts/${script}" "${script_mode}"
        done
        echo "---"
    fi
}

find /tmp/scripts -type f -exec chmod +x {} \;

run_scripts "pre"

# Remove RPMs.
get_json_array remove_rpms '.remove[]' 'packages.json'
if [[ ${#remove_rpms[@]} -gt 0 ]]; then
    echo "-- Removing RPMs defined in recipe.yml --"
    echo "Removing: ${remove_rpms[@]}"
    rpm-ostree override remove "${remove_rpms[@]}"
    echo "---"
fi

# Install RPMs.
get_json_array install_rpms '.install[]' 'packages.json'
if [[ ${#install_rpms[@]} -gt 0 ]]; then
    echo "-- Installing RPMs defined in recipe.yml --"
    echo "Installing: ${install_rpms[@]}"
    rpm-ostree install "${install_rpms[@]}"
    echo "---"
fi

if [[ "${YAFTI_ENABLED}" == "true" ]]; then
    echo "-- firstboot: Installing and enabling \"yafti\" --"
    pip install --prefix=/usr yafti
    # Create symlink to our profile script, which creates the per-user "autorun yafti" links.
    mkdir -p "$(dirname "${FIRSTBOOT_LINK}")"
    ln -s "${FIRSTBOOT_DATA}/launcher/login-profile.sh" "${FIRSTBOOT_LINK}"
else
    echo "-- firstboot: Removing all \"firstboot\" components --"
    # Removes the script symlink that creates the per-user autostart symlinks.
    # We must forcibly remove this here, in case it was added by an upstream image.
    rm -f "${FIRSTBOOT_LINK}"
    # Remove all of the launcher-scripts and yafti config, to de-clutter image and
    # ensure it can't run by accident due to lingering symlinks or upstream image.
    rm -rf "${FIRSTBOOT_DATA}"
fi

# Run "post" scripts.
run_scripts "post"
