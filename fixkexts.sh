# mount the drive as read/write
mount -rw /
 
# create a directory for "disabled" extensions
mkdir /Volumes/Macintosh\ HD/Library/ExtensionsDisabled
 
# view files that exist in your Extensions folder but not the recovery partition
kexts=`comm -23 <(ls /Volumes/Macintosh\ HD/Library/Extensions|sort) <(ls /Library/Extensions|sort)`
echo $kexts
 
# move "extra" kext files to the "disabled" directory
for kext in $kexts; do
    mv /Volumes/Macintosh\ HD/Library/Extensions/$kext /Volumes/Macintosh\ HD/Library/ExtensionsDisabled/$kext; 
done
 
exit