curl "https://s3.amazonaws.com/aws-cli/awscli-bundle-1.18.121.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
