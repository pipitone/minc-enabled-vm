MINC Enabled VM
===============

This repo contains build files to create a Ubuntu 12.04 virtual machine with the following tools installed: 
  - [minc-toolkit version 1.0.01](http://www.bic.mni.mcgill.ca/ServicesSoftware/ServicesSoftwareMincToolKit)
  - [R](http://r-project.org)
  - R packages: [RMINC](http://github.com/mcvaneede/RMINC), [ggplot2](http://ggplot2.org)

Download the Virtual Machine 
----------------------------
If you just want the built virtual machine, you can find it here: 
https://drive.google.com/file/d/0B_tFqyKqazqJSEtoVUNrRU1UZlE/edit?usp=sharing

Unzip and import `box.ovf` into virtualbox as an appliance. 

The default username/password is `vagrant`/`vagrant`. To save space there is no desktop installed, but if you want that, simply log in, and run the command: 

    sudo apt-get install -y ubuntu-desktop
    
## BrainView2
There currently is no easily installable package for [brain-view2](https://github.com/sghanavati/brain-view2), but I've thrown together a quick-and-dirty way of installing it. From a terminal in your VM, run: 


    sudo apt-get install libqt4-opengl libhdf5-serial-1.8.4
    wget http://imaging-genetics.camh.ca/data/brain-view2.tar.gz
    sudo tar -C / -xzf brain-view2.tar.gz
    sudo ln -s /opt/minc/lib/libvolume_io2.so.1.1.2 /opt/minc/lib/libvolume_io2.so.1


Building the Virtual Machine from Scratch
-----------------------------------------
You'll need [Vagrant](http://vagrantup.com), [Ansible](http://ansible.com), and
[virtualbox](http://virtualbox.org). Then, run: 
  
    $ git clone http://github.com/pipitone/minc-enabled-vm
    $ cd minc-enabled-vm
    $ make build-vm 
