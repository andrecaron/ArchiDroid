#!/system/bin/sh
#--------------------------------------------------
# Yank555.lu - generated kernel options init script
#--------------------------------------------------

log_file="/data/kernel-boot.log"

echo "----------------------------------------------------" >$log_file
echo "Yank555.lu - execution of kernel options init script" >>$log_file
echo "----------------------------------------------------" >>$log_file
echo "Kernel version : `uname -a`" >>$log_file

echo `date +"%F %R:%S : Waiting for Android to start..."` >>$log_file

# Wait until we see some android processes to consider boot is more or less complete (credits to AndiP71)
while ! /sbin/pgrep com.android ; do
  sleep 1
done

echo `date +"%F %R:%S : Android is starting up, let's wait another 10 seconds..."` >>$log_file

# Now that is checked, let's just wait another tiny little bit
sleep 10

echo `date +"%F %R:%S : Starting kernel configuration..."` >>$log_file

# Script generated on 19/08/2013 at 20:01
#----------------------------------------------------

# - init.d support by kernel/ramdisk not installed
echo `date +"%F %R:%S : Init.d script execution support disabled."` >>$log_file
ls -al /system/etc/init.d >>$log_file

# - zRam activation - 200Mb
if [ -e /sys/block/zram0/disksize ] ; then
  swapoff /dev/block/zram0
  echo 1 > /sys/block/zram0/reset
  echo 209715200 > /sys/block/zram0/disksize
  echo 1 > /sys/block/zram0/initstate
  swapon /dev/block/zram0
fi
echo `date +"%F %R:%S : 200Mb Zram Support enabled."` >>$log_file

# - Hardswap by Yank555.lu not installed
echo `date +"%F %R:%S : Hardswap Support disabled."` >>$log_file

# - swappiness set to 80
echo 80 > /proc/sys/vm/swappiness;
echo `date +"%F %R:%S : Swappiness set to 80."` >>$log_file

# - Enable custom current forced fast charge
echo 2 > /sys/kernel/fast_charge/force_fast_charge
echo `date +"%F %R:%S : Fast Charge - Custom Current Mode enabled."` >>$log_file
echo 1000 > /sys/kernel/fast_charge/usb_charge_level
echo `date +"%F %R:%S : Fast Charge - USB charge level set to 1000mA/h."` >>$log_file
echo 1000 > /sys/kernel/fast_charge/ac_charge_level
echo `date +"%F %R:%S : Fast Charge - AC charge level set to 1000mA/h."` >>$log_file

echo 475 > /sys/kernel/fast_charge/wireless_charge_level
echo `date +"%F %R:%S : Fast Charge - Wireless charge level set to 475mA/h."` >>$log_file
# - Enable dynamic deferred file sync (by faux123)
#     While screen is on, file sync is temporarily deferred, when screen
#     is turned off, a flush is called to synchronize all outstanding writes.
echo 1 > /sys/kernel/dyn_fsync/Dyn_fsync_active
echo `date +"%F %R:%S : Dynamic Deferred File Sync enabled."` >>$log_file

# - Disable touch wake
echo 0 > /sys/class/misc/touchwake/disabled
echo `date +"%F %R:%S : Touch Wake disabled."` >>$log_file

# - Disable Hardwarekeys light on screen touch
echo 0 > /sys/class/sec/sec_touchkey/touch_led_on_screen_touch
echo `date +"%F %R:%S : Hardwarekeys light on screen touch disabled."` >>$log_file

# - Enable fading notification LED
echo 1 > /sys/class/sec/led/led_fade
echo `date +"%F %R:%S : Notification LED set to fading mode."` >>$log_file

# - Enable notification LED with high intensity
echo 128 > /sys/class/sec/led/led_intensity
echo `date +"%F %R:%S : Notification LED set to high intensity."` >>$log_file

# - Enable notification LED blinking/fading at normal speed
echo 1 > /sys/class/sec/led/led_speed
echo `date +"%F %R:%S : Notification LED set to blinking/fading at normal speed."` >>$log_file

# - Enable notification LED fading in and out
echo "1 1 1 1" > /sys/class/sec/led/led_slope
echo `date +"%F %R:%S : Notification LED fading style to fading in and out."` >>$log_file

# - Do not load CIFS kernel modules on boot
echo `date +"%F %R:%S : CIFS kernel modules not loaded."` >>$log_file

# - Do not load NFS kernel modules on boot
echo `date +"%F %R:%S : NFS kernel modules not loaded."` >>$log_file

# - Do not load ntfs kernel module on boot
echo `date +"%F %R:%S : NTFS kernel module not loaded."` >>$log_file

# - Do not load isofs kernel module on boot
echo `date +"%F %R:%S : ISOFS kernel module not loaded."` >>$log_file

# - Do not load UDF kernel module on boot
echo `date +"%F %R:%S : UDF kernel module not loaded."` >>$log_file

# - Do not load XBOX 360 gamepad kernel module on boot
echo `date +"%F %R:%S : XBOX 360 gamepad support kernel module not loaded."` >>$log_file

# Wait for everything to become ready
echo `date +"%F %R:%S : Waiting 60 seconds..."` >>$log_file
sleep 60
# Internal MMC readahead buffer size
echo 512 > /sys/block/mmcblk0/bdi/read_ahead_kb
echo `date +"%F %R:%S : Internal MMC Readahead set to 512Kb."` >>$log_file

# Internal MMC I/O scheduler
echo "row" > /sys/block/mmcblk0/queue/scheduler
echo `date +"%F %R:%S : Internal MMC scheduler set to ROW."` >>$log_file

# SD card readahead buffer size
echo 1024 > /sys/block/mmcblk1/bdi/read_ahead_kb
echo `date +"%F %R:%S : External MMC Readahead set to 1024Kb."` >>$log_file

# SD card I/O scheduler
echo "cfq" > /sys/block/mmcblk1/queue/scheduler
echo `date +"%F %R:%S : External MMC scheduler set to CFQ."` >>$log_file

# - Set Android Low Memory Killer to not count reserved free memory
echo "1" > /sys/devices/virtual/lmk/lowmemorykiller/lmk_count_reserved_free_memory
echo `date +"%F %R:%S : Android Low Memory Killer set to not count reserved free memory."` >>$log_file

# - Set Android Low Memory Killer to Light (in number of pages of 4Kbytes)
#     Forground apps    : 1024 pages /  4Mb
#     Visible apps      : 2048 pages /  8Mb
#     Secondary server  : 2560 pages / 10Mb
#     Hidden apps       : 4096 pages / 16Mb
#     Content providers : 6144 pages / 24Mb
#     Emtpy apps        : 8192 pages / 32Mb
chmod 664 /sys/module/lowmemorykiller/parameters/minfree
echo "1024,2048,2560,4096,6144,8192" > /sys/module/lowmemorykiller/parameters/minfree
echo `date +"%F %R:%S : Android Low Memory Killer set to Light."` >>$log_file

# Don't set anything related to Boeffla Sound Engine by AndiP71 in this script, allows user scripts to set this in init.d
echo `date +"%F %R:%S : Boeffla Sound Engine not handled by kernel init script."` >>$log_file

echo `date +"%F %R:%S : Finished kernel configuration."` >>$log_file

chmod 644 $log_file

#--------------------------------------------------
# End of generated script
#--------------------------------------------------
