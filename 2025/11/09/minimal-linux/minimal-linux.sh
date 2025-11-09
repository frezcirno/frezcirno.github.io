#!/usr/bin/env bash
# build-rootfs.sh
# 构建最小 rootfs（从宿主系统拷贝二进制 + 自动收集依赖库）
#
# 用法:
#   sudo ./build-rootfs.sh /path/to/rootfs [mode]
#   mode: "glibc" (默认) | "busybox-static"
#
# 说明:
#  - 默认 mode=glibc：拷贝指定的 coreutils/util-linux/procps 二进制并收集 ldd 依赖
#  - mode=busybox-static：使用单个已编译静态 busybox（用户需在 HOST_BUSYBOX_PATH 提供）
#
set -euo pipefail

ROOTFS="${1:-./rootfs}"

# 可按需调整要拷贝的命令列表（优先用宿主系统的路径）
LIBC_BIN_CMDS=( \
  /sbin/ldconfig \
  /usr/bin/catchsegv \
  /usr/bin/getconf \
  /usr/bin/getent \
  /usr/bin/iconv \
  /usr/bin/ldd \
  /usr/bin/locale \
  /usr/bin/localedef \
  /usr/bin/pldd \
  /usr/bin/tzselect \
  /usr/bin/zdump \
  /usr/sbin/iconvconfig \
  /usr/sbin/zic \
)
CORE_CMDS=( \
  /bin/cat /bin/tac /usr/bin/nl /usr/bin/od \
  /usr/bin/base32 /usr/bin/base64 /usr/bin/basenc \
  /usr/bin/fmt /usr/bin/pr /usr/bin/fold \
  /usr/bin/head /usr/bin/tail /usr/bin/split /usr/bin/csplit \
  /usr/bin/wc /usr/bin/sum /usr/bin/cksum /usr/bin/md5sum \
  /usr/bin/b2sum /usr/bin/sha1sum /usr/bin/sha224sum \
  /usr/bin/sha256sum /usr/bin/sha384sum /usr/bin/sha512sum \
  /usr/bin/sort /usr/bin/shuf /usr/bin/uniq /usr/bin/comm \
  /usr/bin/ptx /usr/bin/tsort /usr/bin/cut /usr/bin/paste \
  /usr/bin/join /usr/bin/tr /usr/bin/expand /usr/bin/unexpand \
  /bin/ls /usr/bin/dir /usr/bin/vdir /usr/bin/dircolors \
  /bin/cp /usr/bin/dd /usr/bin/install /bin/mv /bin/rm \
  /usr/bin/shred /usr/bin/link /bin/ln /usr/bin/mkdir \
  /usr/bin/mkfifo /usr/bin/mknod /usr/bin/readlink /usr/bin/rmdir \
  /usr/bin/unlink /usr/bin/chown /usr/bin/chgrp /usr/bin/chmod \
  /usr/bin/touch /usr/bin/df /usr/bin/du /usr/bin/stat \
  /usr/bin/sync /usr/bin/truncate /bin/echo /usr/bin/printf \
  /usr/bin/yes /usr/bin/false /usr/bin/true /usr/bin/test \
  /usr/bin/expr /usr/bin/tee /usr/bin/basename /usr/bin/dirname \
  /usr/bin/pathchk /usr/bin/mktemp /usr/bin/realpath /usr/bin/pwd \
  /usr/bin/stty /usr/bin/printenv /usr/bin/tty /usr/bin/id \
  /usr/bin/logname /usr/bin/whoami /usr/bin/groups /usr/bin/users \
  /usr/bin/who /usr/bin/pinky /usr/bin/date /usr/bin/arch \
  /usr/bin/nproc /usr/bin/uname /usr/bin/hostname /usr/bin/hostid \
  /usr/bin/uptime /usr/bin/chcon /usr/bin/runcon /usr/bin/chroot \
  /usr/bin/env /usr/bin/nice /usr/bin/nohup /usr/bin/stdbuf \
  /usr/bin/timeout /usr/bin/kill /usr/bin/sleep /usr/bin/factor \
  /usr/bin/numfmt /usr/bin/seq \
  /usr/bin/\[ /usr/bin/test /usr/bin/expr \
)
UTIL_LINUX_CMDS=( \
  /sbin/mount /sbin/umount /usr/bin/findmnt /usr/bin/mountpoint \
  /sbin/losetup /usr/sbin/blkid /usr/bin/lsblk /sbin/fdisk \
  /usr/sbin/sfdisk /usr/sbin/partx /usr/bin/swapon /usr/bin/swapoff \
  /usr/sbin/mkswap /usr/bin/dmesg /sbin/hwclock /usr/bin/logger \
  /usr/bin/wall /usr/bin/write /sbin/agetty /usr/bin/login \
  /usr/bin/uuidgen /usr/sbin/uuidd /usr/bin/rename /usr/bin/col \
  /usr/bin/colcrt /usr/bin/colrm /usr/bin/column \
  /usr/bin/hexdump /usr/bin/hd /usr/bin/look /usr/bin/ul \
  /usr/bin/chfn /usr/bin/chsh /usr/bin/chrt /usr/bin/taskset \
  /usr/bin/lslogins /usr/bin/loginctl /usr/bin/fallocate \
  /usr/bin/blockdev /usr/bin/mkfs /usr/bin/mkfs.bfs \
  /usr/sbin/ctrlaltdel \
)
PROCPS_CMDS=( /usr/bin/ps /usr/bin/top /usr/bin/free /usr/bin/uptime )
NET_TOOLS_CMDS=( /sbin/ifconfig /sbin/ip /usr/sbin/ss /usr/sbin/netstat /usr/sbin/route )
SHELL_CANDIDATES=( /bin/bash /bin/sh /bin/ash /bin/dash )
NET_UTILS=( /sbin/ifconfig /sbin/ip /usr/sbin/ss /usr/sbin/netstat /usr/sbin/route )
EXTRA=( /bin/hostname /usr/bin/lsof /usr/bin/wget )

# Busybox (仅当 mode=busybox-static 且宿主提供时使用)
HOST_BUSYBOX_PATH="${HOST_BUSYBOX_PATH:-/usr/local/bin/busybox}"  # 可覆盖

# helpers
info(){ printf '\e[1;32m[INFO]\e[0m %s\n' "$*"; }
warn(){ printf '\e[1;33m[WARN]\e[0m %s\n' "$*"; }
err(){ printf '\e[1;31m[ERROR]\e[0m %s\n' "$*"; exit 1; }

mkdir_p() { mkdir -p -- "$@"; }

# gather list of binaries to copy (resolve real paths)
collect_bins() {
  local -n out=$1
  out=()
  for f in "${LIBC_BIN_CMDS[@]}" "${CORE_CMDS[@]}" "${UTIL_LINUX_CMDS[@]}" "${PROCPS_CMDS[@]}" "${NET_TOOLS_CMDS[@]}" "${EXTRA[@]}"; do
    if [ -x "$f" ]; then
      out+=("$f")
    else
      # try which
      cmdname="$(basename "$f")"
      path="$(command -v "$cmdname" 2>/dev/null || true)"
      if [ -n "$path" ]; then
        out+=("$path")
      fi
    fi
  done

  # ensure we have a shell and an init candidate
  SHELL_BIN=""
  for s in "${SHELL_CANDIDATES[@]}"; do
    if [ -x "$s" ]; then
      SHELL_BIN="$s"
      break
    fi
  done
  if [ -n "$SHELL_BIN" ]; then
    out+=("$SHELL_BIN")
  else
    warn "No shell found on host; you'll need to provide one (bash/sh) or use busybox-static mode."
  fi
}

# copy binary and its parent dir structure
copy_bin() {
  local src="$1"
  local dstroot="$2"
  if [ ! -f "$src" ]; then
    warn "binary not found: $src"
    return
  fi
  local dst="$dstroot${src}"
  mkdir_p "$(dirname "$dst")"
  cp -a -- "$src" "$dst"
  # preserve permissions
  chmod --reference="$src" "$dst"
}

# collect shared libs via ldd and copy them
copy_libs_for_bin() {
  local bin="$1"
  local dstroot="$2"
  # ldd may fail for statically linked; handle gracefully
  if ldd_output="$(ldd "$bin" 2>/dev/null)" ; then
    while IFS= read -r line; do
      # lines like: linux-vdso.so.1 (0x00007fff...)
      # or: libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f...)
      # or: /lib64/ld-linux-x86-64.so.2 (0x...)
      libpath=""
      if [[ "$line" =~ "=>" ]]; then
        libpath="$(echo "$line" | awk '{for(i=1;i<=NF;i++){ if ($i == "=>"){ print $(i+1); break }}}')"
      else
        # fallback: first token that starts with /
        libpath="$(echo "$line" | awk '{for(i=1;i<=NF;i++){ if ($i ~ /^\//){ print $i; break }}}')"
      fi
      if [ -n "$libpath" ] && [ -f "$libpath" ]; then
        # copy into same relative path under rootfs
        mkdir_p "$dstroot$(dirname "$libpath")"
        cp -a -- "$libpath" "$dstroot$libpath"

        # if it's a symlink, also copy the target
        if [ -L "$libpath" ]; then
          target="$(readlink "$libpath")"
          # handle relative symlinks
          if [[ "$target" != /* ]]; then
            target="$(dirname "$libpath")/$target"
          fi
          if [ -f "$target" ]; then
            mkdir -p "$dstroot$(dirname "$target")"
            cp -a -- "$target" "$dstroot$target"
          fi
        fi
      fi
    done <<< "$ldd_output"
  else
    # not a dynamic ELF or ldd failed
    :
  fi
}

create_basic_tree() {
  local r="$1"
  info "Creating base directories under $r"
  mkdir_p "$r"/{bin,sbin,etc,proc,sys,dev,lib,lib64,usr,usr/bin,usr/sbin,tmp,var,root,home}
  chmod 1777 "$r/tmp"
}

write_etc_files() {
  local r="$1"
  info "Writing /etc/passwd, /etc/group, /etc/inittab, /etc/fstab, /etc/profile"
  cat > "$r/etc/passwd" <<'EOF'
root:x:0:0:root:/root:/bin/sh
EOF

  cat > "$r/etc/group" <<'EOF'
root:x:0:
EOF

  # minimal shadow (empty password; you can set hashed passwd if needed)
  cat > "$r/etc/shadow" <<'EOF'
root:*:18500:0:99999:7:::
EOF
  chmod 600 "$r/etc/shadow"

  # fstab - auto mount proc/sys/devtmpfs if using our init scripts
  cat > "$r/etc/fstab" <<'EOF'
proc    /proc   proc    defaults    0 0
sysfs   /sys    sysfs   defaults    0 0
devtmpfs /dev   devtmpfs defaults    0 0
EOF

  # simple profile
  cat > "$r/etc/profile" <<'EOF'
export PATH=/bin:/sbin:/usr/bin:/usr/sbin
export HOME=/root
export TERM=${TERM:-vt100}
EOF

  # simple /etc/inittab for busybox-style init (if using busybox init)
  cat > "$r/etc/inittab" <<'EOF'
::sysinit:/etc/init.d/rcS
ttyS0::respawn:/bin/sh
::ctrlaltdel:/sbin/reboot
EOF
}

write_init_script() {
  local r="$1"
  info "Writing simple /etc/init.d/rcS and /sbin/init wrapper"
  mkdir -p "$r/etc/init.d"
  cat > "$r/etc/init.d/rcS" <<'EOF'
#!/bin/sh
set -eu

# mount pseudo fs if not mounted
mount -t proc proc /proc 2>/dev/null || true
mount -t sysfs sys /sys 2>/dev/null || true

# Prefer devtmpfs, otherwise bind host /dev if running from host
if ! mountpoint -q /dev; then
  if mount -t devtmpfs devtmpfs /dev 2>/dev/null; then
    :
  else
    echo "Warning: devtmpfs not available; try bind mounting /dev from host"
  fi
fi

# devpts for pty allocation
if [ ! -d /dev/pts ] ; then
  mkdir -p /dev/pts
fi
if ! mountpoint -q /dev/pts; then
  mount -t devpts devpts /dev/pts -o gid=5,mode=620 2>/dev/null || true
fi

# ensure /tmp exists
mkdir -p /tmp
chmod 1777 /tmp

echo "Minimal rootfs boot complete."

# helper: try to spawn agetty on given device, return 0 on success
try_getty() {
  dev=$1
  if [ -c "/dev/${dev}" ] || [ -e "/dev/${dev}" ]; then
    if [ -x /sbin/agetty ]; then
      echo "Starting agetty on ${dev}..."
      exec /sbin/agetty -L "${dev}" 115200 vt100
      return 0
    fi
  fi
  return 1
}

# Preferred tty devices to try (adjust order for your env)
for tty in tty1 ttyS0 console; do
  # only try when device exists and is a character device (or present)
  if [ -e "/dev/$tty" ]; then
    try_getty "$tty" && exit 0
  fi
done

# If no suitable tty or agetty absent, spawn a shell on current stdio
echo "No usable tty for getty found. Dropping to shell."
exec /bin/sh -l
EOF
  chmod +x "$r/etc/init.d/rcS"

  # Provide a PID 1 init that simply runs the rcS and then respawns a shell.
  # If busybox is used as init, it will replace this.
  cat > "$r/sbin/init" <<'EOF'
#!/bin/sh
# very small pid 1 wrapper
/bin/sh /etc/init.d/rcS
# if that returns, keep a shell on console
exec /bin/sh
EOF
  chmod +x "$r/sbin/init"
}

copy_binaries_and_libs() {
  local r="$1"
  local -n bins_ref=$2
  info "Copying binaries to $r and collecting shared libs"
  for b in "${bins_ref[@]}"; do
    info " -> $b"
    copy_bin "$b" "$r"
    copy_libs_for_bin "$b" "$r"
  done
}

copy_loader() {
  # copy dynamic linker (ld-linux*) if exists
  local r="$1"
  # try common locations
  for ld in /lib64/ld-linux-x86-64.so.2 /lib/ld-linux.so.2 /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 /lib/ld-musl-x86_64.so.1; do
    if [ -f "$ld" ]; then
      mkdir -p "$r$(dirname "$ld")"
      cp -a -- "$ld" "$r$ld"
    fi
  done
}

# ----------
# Main
# ----------
info "Build rootfs into: $ROOTFS (mode=glibc)"
if [ -e "$ROOTFS" ]; then
  warn "$ROOTFS already exists — existing files may be overwritten"
fi

create_basic_tree "$ROOTFS"
write_etc_files "$ROOTFS"
write_init_script "$ROOTFS"

# glibc mode: collect binaries from lists
declare -a BINS
collect_bins BINS
# ensure we have at least a shell
if [ ${#BINS[@]} -eq 0 ]; then
warn "No binaries discovered to copy. Exiting."
exit 1
fi
copy_binaries_and_libs "$ROOTFS" BINS
copy_loader "$ROOTFS"

# ensure /bin/sh exists: prefer host shell or symlink to busybox if provided
if [ ! -e "$ROOTFS/bin/sh" ]; then
  # try to find a shell binary inside rootfs
  if [ -x "$ROOTFS/bin/bash" ]; then
    ln -s /bin/bash "$ROOTFS/bin/sh"
  elif [ -x "$ROOTFS/bin/dash" ]; then
    ln -s /bin/dash "$ROOTFS/bin/sh"
  elif [ -x "$ROOTFS/bin/ash" ]; then
    ln -s /bin/ash "$ROOTFS/bin/sh"
  elif [ -x "$ROOTFS/bin/$(basename "$HOST_BUSYBOX_PATH")" ]; then
    ln -s /bin/$(basename "$HOST_BUSYBOX_PATH") "$ROOTFS/bin/sh"
  else
    warn "/bin/sh not found in rootfs. You may not be able to get a shell."
  fi
fi

# finalize permissions
chmod 755 "$ROOTFS" || true
info "Rootfs build complete at $ROOTFS"

cat <<EOF

Next steps / hints:
- To test with qemu:
  qemu-system-x86_64 -kernel /path/to/bzImage -initrd rootfs.cpio.gz -nographic -append "console=ttyS0 root=/dev/ram0 rdinit=/sbin/init"

- Or create an initramfs:
  cd $ROOTFS
  find . | cpio -H newc -o --owner root:root > ../rootfs.cpio
  gzip -9 ../rootfs.cpio

- Or chroot into it (as root):
  mount --bind /proc $ROOTFS/proc
  mount --bind /sys  $ROOTFS/sys
  mount --bind /dev  $ROOTFS/dev
  chroot $ROOTFS /sbin/init

EOF
