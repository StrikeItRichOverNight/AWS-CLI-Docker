# AWS-CLI-Docker

### Prerequisite
Install aws-cli on your computer
[Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

## How to Build
```bsah
docker build . -t aws-cli
```

## How to use
```bash
docker run -v ~/.aws:/home/awsuser/.aws --rm -it aws-cli bash
```
