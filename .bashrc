umask 022
alias goCoprHDSource="cd /workspace/coprhd/coprhd-controller"

prepareGit(){
	git config --global user.name Om Ganesh
	git config --global user.email om.ganesh@emc.com
	git config --global credential.helper "cache --timeout=3600"
}
