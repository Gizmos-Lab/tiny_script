#!/bin/bash
#
# Copyright (C) 2015-2017, SujitRoy
#
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# Please maintain this if you use this script or any part of it
#
 
# source envsetup


# hals changes
echo clean hals and use my own 


rm -rf hardware/broadcom/wlan
git clone https://github.com/Gizmos-Lab/hardware_broadcom_wlan.git hardware/broadcom/wlan

rm -rf hardware/ril
git clone https://github.com/Gizmos-Lab/android_hardware_ril.git hardware/ril

rm -rf hardware/qcom/display
git clone https://github.com/Gizmos-Lab/android_hardware_qcom_display.git hardware/qcom/display

rm -rf hardware/qcom/audio
git clone https://github.com/Gizmos-Lab/android_hardware_qcom_audio.git hardware/qcom/audio 

rm -rf hardware/qcom/gps 
git clone https://github.com/Gizmos-Lab/android_hardware_qcom_gps.git hardware/qcom/gps


rm -rf system/nfc
git clone https://github.com/Gizmos-Lab/system_nfc.git  system/nfc


#clone device source
echo clone device source !!!

git clone https://github.com/Gizmos-Lab/android_device_lge_hammerhead.git device/lge/hammerhead -b aosip

git clone https://github.com/Gizmos-Lab/android_kernel_lge_hammerhead.git kernel/lge/hammerhead -b test

git clone https://github.com/DirtyUnicorns/android_vendor_lge.git vendor/lge -b o8x


# set jack server heap size 
echo set jack server heap size 
export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx32g"

# restart jack server
echo Restartig jack server to apply changes ! 
./prebuilts/sdk/tools/jack-admin kill-server
./prebuilts/sdk/tools/jack-admin start-server



echo Start envsetup.sh
. build/e*

lunch aosip_hammerhead-userdebug

make kronic -j20


