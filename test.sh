(printf "vm-worker: " && hostname -i && time aws s3 cp ./hosts.txt s3://tcss-562 && echo "========")  &>> output.txt
aws s3 cp ./output.txt s3://tcss-562/output-$HOSTNAME
