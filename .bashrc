umask 022
alias goCoprHDSource="cd /workspace/coprhd/coprhd-controller"
alias listDb="/opt/storageos/bin/dbcli list"

prepareGit(){
	git config --global user.name Om Ganesh
	git config --global user.email om.ganesh@emc.com
	git config --global credential.helper "cache --timeout=3600"
}


setDebug(){
	for i in `find /opt/storageos/bin -name "*-debug"`
	do 
		origName=`echo "$i" | cut -d '-' -f1`
		cp $i $origName
	done
}


resetAudit(){
	rm -f /var/log/audit/audit.log
	systemctl restart auditd 
}

restartVipr(){
	/etc/storageos/storageos restart 
}

cleanAuditLog(){
	rm -rf /var/log/audit/audit.log
}


cleanViprDb(){
	value=`/opt/storageos/bin/dbcli list $1 | grep 'id:' | cut -d ' ' -f2`
	list=`echo $value | sed 's/ /,/g'`
	/opt/storageos/bin/dbcli delete -i "$list" $1

}
cleanUmfs(){
	cleanViprDb UnManagedFileSystem
}
