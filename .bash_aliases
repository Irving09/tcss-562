alias openalias="nano ~/.bash_aliases"
alias refresh=". ~/.bash_aliases"
alias jmeter="/home/ubuntu/apache-jmeter-3.2/bin/jmeter.sh"
alias updateAllVms="parallel-ssh -h ./hosts.txt -l ubuntu -P -x \"-i ./inno-personal.pem\" git pull origin master"
alias clearOutputAllVms="parallel-ssh -h ./hosts.txt -l ubuntu -P -x \"-i ./inno-personal.pem\" rm output/download_* output/upload_*"

goec2() {
    ssh -i ./inno-personal.pem $1
}

simulateUpload() {
  testLoop=$2;
  if [ -z "$2" ]
  then
    testLoop=1;
  fi

  echo "running tests $testLoop time(s)"
  for ((c=1; c<=$testLoop; c++ ))
  do
    parallel-ssh -h ./hosts.txt -l ubuntu -P -x "-i ./inno-personal.pem" bash upload.sh $1
  done
}

simulateDownload() {
  testLoop=$2;
  if [ -z "$2" ]
  then
    testLoop=1;
  fi

  echo "running tests $testLoop time(s)"
  for ((c=1; c<=$testLoop; c++ ))
  do
    parallel-ssh -h ./hosts.txt -l ubuntu -P -x "-i ./inno-personal.pem" bash download.sh $1
  done
}

testForloop() {
  testLoop=$1;
  if [ -z "$1" ]
  then
    testLoop=1;
  fi

  for ((c=1; c<=$testLoop; c++ ))
  do
    echo "$c"
  done
}

copyToAllVms() {
	scp -i ./inno-personal.pem $1 ubuntu@172.31.4.17:~
	scp -i ./inno-personal.pem $1 ubuntu@172.31.4.206:~
	scp -i ./inno-personal.pem $1 ubuntu@172.31.4.207:~
	scp -i ./inno-personal.pem $1 ubuntu@172.31.1.132:~
	scp -i ./inno-personal.pem $1 ubuntu@172.31.12.241:~
	scp -i ./inno-personal.pem $1 ubuntu@172.31.5.78:~
	scp -i ./inno-personal.pem $1 ubuntu@172.31.3.242:~
	scp -i ./inno-personal.pem $1 ubuntu@172.31.6.4:~
	scp -i ./inno-personal.pem $1 ubuntu@172.31.9.182:~
	scp -i ./inno-personal.pem $1 ubuntu@172.31.2.222:~
}
