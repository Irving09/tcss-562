alias openalias="nano ~/.bash_aliases"
alias refresh=". ~/.bash_aliases"
alias jmeter="/home/ubuntu/apache-jmeter-3.2/bin/jmeter.sh"
alias updateAllVms="parallel-ssh -h ./hosts.txt -l ubuntu -P -x \"-i ./inno-personal.pem\" git pull origin master"

goec2() {
    ssh -i ./inno-personal.pem $1
}

simulateUpload() {
	parallel-ssh -h ./hosts.txt -l ubuntu -P -x "-i ./inno-personal.pem" bash upload.sh $1
}

simulateDownload() {
	parallel-ssh -h ./hosts.txt -l ubuntu -P -x "-i ./inno-personal.pem" bash download.sh $1
}
