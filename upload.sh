today=`date +%Y-%m-%d.%H:%M:%S`
(printf "vm-worker: $(hostname -i)" && start=$(date +%s%N) && aws s3 cp $1 s3://tcss-562/upload/$HOSTNAME"-"$1 && end=$(date +%s%N) && echo "$((end - start))ns" && echo "========")  &>> ./output/upload_output.txt
aws s3 cp ./output/upload_output.txt s3://tcss-562/upload/output-$HOSTNAME
