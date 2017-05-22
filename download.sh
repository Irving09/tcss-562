(printf "vm-worker: " && hostname -i && time aws s3 cp s3://tcss-562/download/$1 ./output && echo "========")  &>> ./output/download_output.txt
aws s3 cp ./output/download_output.txt s3://tcss-562/download/output-$HOSTNAME
