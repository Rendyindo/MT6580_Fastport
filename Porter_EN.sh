#!/bin/sh

fp="${BASH_SOURCE:-$0}";
fp="$(dirname "$(readlink -f "$fp")")";

cd "$fp";

filefolderimg=$fp/put_system.img_and_boot.img_here
filefolderfiles=$fp/files
filefoldertools=$fp/tools

invalidopt(){
echo "Invalid option..."
echo "Exiting..."
sleep 4
exit
}

caosp(){
 echo "Sorry, this feature isn't yet finished :("
 printf %s "Press any key to continue..."
 read wat
 mainmenu
}

scport(){
clear
echo ""
echo          **********************
echo          *  SAME CHIPSET PORT * 
echo          **********************
echo ""
echo ""
echo ______________________
echo ""
echo A. Port system.img
echo B. Port system.new.dat
echo C. Port system folder
echo ______________________
printf %s "Type your option:"
read option2
case $option2 in
 a|A) scportimg;;
 b|B) scportnewdat;;
 c|C) scportfolder;;
 *) invalidopt;;
esac
}

scportnewdat(){
clear
echo "- Converting system.new.dat into system.img..."
python $filefoldertools/sdat2img.py $filefolderimg/system.transfer.list $filefolderimg/system.new.dat $filefolderimg/system.img
scportimg
}

scportimg(){
echo ""
echo "- Extracting system.img..."
mkdir $filefolderimg/system
mkdir $filefolderimg/sys
mount -t ext4 -o loop $filefolderimg/system.img $filefolderimg/sys
cp -rf $filefolderimg/sys $filefolderimg/system
umount $filefolderimg/sys
scportfolder
}

scportfolder(){
echo "- Extracting boot.img..."
. $filefoldertools/unpackboot/unpackimg.sh $filefolderimg/boot.img

echo "- Porting boot.img..."
cp $filefolderfiles/zImage $filefoldertools/unpackboot/split_img/boot.img-zImage
cp $filefolderfiles/fstab.mt6580 $filefoldertools/unpackboot/ramdisk/fstab.mt6580
chmod 0640 $filefoldertools/unpackboot/ramdisk/fstab.mt6580

echo "- Repacking the boot.img..."
. $filefoldertools/tools/unpackboot/repackimg.sh
cp $filefoldertools/tools/unpackboot/image-new.img $filefolderimg/boot.img

echo "- Porting system..."
cp -rf $filefolderfiles/lib $filefolderimg/system/lib
cp -rf $filefolderfiles/bin $filefolderimg/system/bin

echo "- Zipping..."
cd $filefolderimg
zip -r ROM.zip system boot.img META-INF

echo "- Done!"
}

mainmenu(){
 echo "Fastport for Infinix Hot 2"
 echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 echo +          For system.new.dat, put system.transfer.list too                   +
 echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 echo + 1. Put system.img and boot.img at folder $filefolderimg                     +
 echo + 2. Press anything in the keyboard :3                                        +
 echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 echo +                  Made by RendyAK @ Ambaradul Team                           +
 echo +        Redesigned by Nana Iyke Quame @ Android Matrix Development           +
 echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 echo Warning!
 echo This will remove old rom, system, maded by this Fastport!
 echo ""
 echo ""
 echo                       Select An Option : 
 echo ""
 echo                 +============================+
 echo ""
 echo                     1.  Same chipset Port          
 echo ""
 echo ""
 printf %s "Type option:"
 read option
 case $option in
  1) scport;;
  *) invalidopt;;
 esac
}

mainmenu
