    $ BLACKLIST_FILE=$(cat <<ENDFILE
    blacklist nouveau
    options nouveau modeset=0
    ENDFILE
    )
    $ MODPROBE_FILE=$(cat <<ENDFILE
    nvidia
    nvidia_vgpu_vfio
    ENDFILE
    )
    $ echo "${MODPROBE_FILE}" > /etc/modules-load.d/nvidia.conf
    $ echo "${BLACKLIST_FILE}" > /etc/modprobe.d/blacklist-nouveau.conf
