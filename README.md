 PandoraX 
==========

PandoraX is just a toy I'm playing with, nothing serious.

Please read LICENSE for the license.

 Using PandoraX 
================

The easiest way to use it is to burn it into a usb stick. Here are the steps
to do so:

* First, make sure where your usb stick is, mine is at /dev/sdb
* Now, run gen_img.sh if you haven't already
* In the working directory, do: dd if=pandorax.img of=/dev/sdb
* And voilà! You now just need to boot with the usb stick in the usb port
  and set the BIOS to boot from the USB stick
