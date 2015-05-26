# satis-s3

A simple script that runs [Satis](https://github.com/composer/satis) and uploads the artifacts to S3.

There is a Dockerfile and an existing image available on the public registry at [iainmckay/satis-s3](https://registry.hub.docker.com/u/iainmckay/satis-s3/).

## Setup

The script assumes that Satis has already been installed, you need to provide the path to the Satis console when running the script. If you haven't installed it already, go ahead and do that.

See the Configuration section below for a list of environment variables the script expects.

## Running

Simply execute `run.sh`:

    $ ./run.sh <path to satis script> <path to config.json> <output path>

Note: The uploaded artifacts are marked as being publicly readable.

## Configuration 

The script requires the following environment variables:

Name | Description
--- | --- | ---
AWS_ACCESS_KEY_ID | Your AWS access key
AWS_SECRET_ACCESS_KEY | Your AWS secret access key
AWS_DEFAULT_REGION | The AWS region the bucket is in
S3_BUCKET | The bucket to write the artifacts to
S3_PATH | The path inside the bucket to write the artifacts to

## Docker container

The docker container expects `config.json` to be available at `/config.json`. You can either provide it through a volume or build your own container.