today=`date +%Y-%m-%d.%H:%M:%S`
(printf "vm-worker: " && hostname -i && time aws s3 cp $1 s3://tcss-562/upload/$today"-"$1 && echo "========")  &>> ./output/upload_output.txt
aws s3 cp ./output/upload_output.txt s3://tcss-562/upload/output-$HOSTNAME
