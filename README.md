# AWS-CLI-Docker

## How to Build
```bsah
docker build . -t aws-cli
```

## How to use
```bash
docker run -v ~/.aws:/root/.aws --rm -it aws-cli bash
```
