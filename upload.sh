today=`date +%Y-%m-%d.%H:%M:%S`
(printf "vm-worker: $(hostname -i)" && echo "" && start=$(date +%s%N) && aws s3 cp $1 s3://tcss-562/upload/$HOSTNAME"-"$1 && end=$(date +%s%N) && echo "$((end - start))ns")  &>> ./output/upload_output.txt
aws s3 cp ./output/upload_output.txt s3://tcss-562/upload/output-$HOSTNAME --acl public-read
tail -1 ./output/upload_output.txt &>> ./output/upload_speed.$1.txt
aws s3 cp ./output/upload_speed.$1.txt s3://tcss-562/upload/upload_speed.$HOSTNAME.$1.txt --acl public-read
