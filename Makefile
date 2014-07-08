# Usage: make <command>
# 
# Commands: 
#    help           This help.
help: 
	@grep '^# ' Makefile | sed 's/^#//g'

RMINC-master.zip: 
	wget -c -O RMINC-master.zip http://github.com/pipitone/RMINC/archive/master.zip

minc-toolkit.deb: 
	wget -c -O minc-toolkit.deb http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/minc-toolkit-1.0.01-20131211-Ubuntu_12.04-x86_64.deb

#    build-vm       Construct the virtual machine.
build-vm: RMINC-master.zip minc-toolkit.deb 
	vagrant up --provision

#    provision      Re-run provisioning of an already created VM.
provision: RMINC-master.zip minc-toolkit.deb 
	vagrant provision

#    dist           Prepare a vm for distribution (creates box.zip).
dist: 
	vagrant package
	tar xvzf package.box
	zip box.zip box-*

#    clean          Clean up temporary files and destroy the vm.
clean: 
	rm -f RMINC-master.zip minc-toolkit.deb
	vagrant destroy
