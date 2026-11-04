#!/bin/bash
set -e
W="/mnt/d/ROM FILES/LineageOS Files/Note 20 Ultra/Build_Kerns"
MK=~/kernel-build/tools/mkbootimg/mkbootimg.py
AVB=~/kernel-build/tools/avb/avbtool.py
NAME=${1:-boot-test}
cp ~/kernel-build/kernel/out/arch/arm64/boot/Image ~/kernel-build/Image-$NAME
python3 $MK --header_version 2 \
  --kernel ~/kernel-build/Image-$NAME --ramdisk "$W/extracted/ramdisk" --dtb "$W/extracted/dtb" \
  --base 0x10000000 --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 \
  --second_offset 0x00000000 --tags_offset 0x00000100 --dtb_offset 0x00000000 \
  --pagesize 2048 --os_version 17.0.0 --os_patch_level 2026-10 \
  -o "$W/output/$NAME.img"
python3 $AVB add_hash_footer --image "$W/output/$NAME.img" \
  --partition_size 61865984 --partition_name boot --algorithm NONE \
  --prop com.android.build.boot.os_version:17 \
  --prop "com.android.build.boot.fingerprint:samsung/lineage_c2s/c2s:17/CP2A.260605.016/601964eb0d:userdebug/test-keys"
cd "$W/output" && cp $NAME.img boot.img && tar -H ustar -cf $NAME.tar boot.img && rm boot.img
ls -l "$W/output/$NAME.tar"
