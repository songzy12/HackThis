# Missile Codes

<https://defendtheweb.net/playground/missile-codes>

## fdisk

```bash
$ fdisk -lu forensics1.img
Disk forensics1.img: 25 MiB, 26214400 bytes, 51200 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

## foremost

<https://tools.kali.org/forensics/foremost>

```bash
sudo apt install foremost
foremost forensics1.img
```

## jpg

Then check the `output/jpg/`, we can find

- `Forensics/Missile-Codes/output/jpg/00032123.jpg`, access code is `12345`.
- `Forensics/Missile-Codes/output/jpg/00045572.jpg`, password is `secret`.

Unfortunately, these two are not correct.

Also, from `Forensics/Missile-Codes/output/jpg/00032123.jpg`, we have `123`.

This is the correct password.

## rar

Unzip the rar file: `Forensics/Missile-Codes/output/rar/00017414.rar`.

We would get an audio file: `conversation_dtmf.wav`.

## dtmf

Search `dtmf` in the audio file name, we would know <https://en.wikipedia.org/wiki/Dual-tone_multi-frequency_signaling>.

## multimon-ng

<https://github.com/EliasOenal/multimon-ng>

multimon-ng is the successor of multimon. It decodes the following digital transmission modes:

- DTMF

```bash
mkdir build
cd build
cmake ..
make
sudo make install
```

```bash
multimon-ng -t wav conversation_dtmf.wav -s SCOPE -a DTMF | grep DTMF
```

```text
DTMF: A
DTMF: A
DTMF: 6
DTMF: B
DTMF: A
DTMF: 4
DTMF: A
DTMF: 8
DTMF: 3
DTMF: C
DTMF: 6
DTMF: 7
DTMF: D
DTMF: D
DTMF: C
DTMF: 7
```

## product key format

aa6b-a4a8-3c67-ddc7

## Reference

<https://medium.com/@mr.rat1100/p0isonp4wn-hackthis-forensics-writeup-efd1764a981b>

## Appendix

## file

```bash
$ file forensics1.img
forensics1.img: Linux rev 1.0 ext4 filesystem data, UUID=3252234c-f5e0-4ed4-a809-beb029819989, volume name "Forensics" (extents) (huge files)
```

## mount

<https://www.man7.org/linux/man-pages/man8/mount.8.html>

```bash
$ mount -t ext4
/dev/sda1 on / type ext4 (rw,relatime,errors=remount-ro)
```

```bash
sudo mount forensics1.img /mnt
```

```bash
$ mount -t ext4
/dev/sda1 on / type ext4 (rw,relatime,errors=remount-ro)
/home/songzy/HackThis/Forensics/Missile-Codes/forensics1.img on /mnt type ext4 (rw,relatime)
```

```bash
ls /mnt
```

```bash
sudo umount /mnt
```

## binwalk

```bash
sudo apt install binwalk
binwalk forensics1.img
```

### rarcrack

<https://github.com/ziman/rarcrack>