(printf "vm-worker: $(hostname -i)" && echo "" && start=$(date +%s%N) && aws s3 cp s3://tcss-562/download/$1 ./output && end=$(date +%s%N) && echo "$((end - start))ns")  &>> ./output/download_output.txt
aws s3 cp ./output/download_output.txt s3://tcss-562/download/output-$HOSTNAME
tail -1 ./output/download_output.txt &>> ./output/download_speed.$1.txt
aws s3 cp ./output/download_speed.$1.txt s3://tcss-562/download/download_speed.$HOSTNAME.$1.txt
