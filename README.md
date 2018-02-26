# aws_fundamentals_training

# Presentation - [link](https://docs.google.com/presentation/d/1LFcGFRunab_0UKTUX6_0WxXR2kR6yyt38DQCP8c3Ydw/edit?usp=sharing)

# Cloud formation usage examples:

aws cloudformation package --template-file training-ec2.yml --output-template-file training-output.yml --s3-bucket training 

aws cloudformation deploy --template-file training-output.yml --capabilities CAPABILITY_IAM --stack-name training-ec2-name --parameter-overrides Env=some-name

