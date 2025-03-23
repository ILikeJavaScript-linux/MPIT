
![matrixis_logo](Matrixis_20250323153412.png)

# MPIT
MPIT (Matrixis Package Installation Tool) Is a PM made on my phone and a part of upcoming distro named Matrixis. This package is for buildroot only

# Usage : (sudo) mpit --arg package_name

[-i --install] install a package

[-h --help] get help

[-v --version] version

# Steps to integrate this package.
1. CD to Your BuildRoot Folder
2. Enter 'mkdir package/mpit' in your linux terminal
3. Copy my Repo Files to the Folder
4. Register MPIT in config.in by typing 'source "package/mpit/config.in' on any line
5. run 'make menuconfig' and select 'Target packages'
6. Tap on / symbol and search 'mpit' It will show you where is the MPIT package
7. Once you've Found MPIT. Tap on Space key with it selected. it will turn into a star.
8. Now. Exit with saves
9. Compile the buildroot by 'make' or 'make -j$(nproc)' but carefully on your system!
10. Have fun!

!!! THIS IS AN ALPHA SO EXPECT BIG ERRORS !!!
