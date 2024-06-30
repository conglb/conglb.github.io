--
title: How to set up and use AWS CLI
layout: post
tag: computer science
comments: true
--

Here's a detailed guide on how to use the AWS CLI to manage your AWS services from the command line.

### Step 1: Install AWS CLI

#### On Windows

1. Download the AWS CLI MSI installer from the [AWS website](https://aws.amazon.com/cli/).
2. Run the MSI installer and follow the instructions.

#### On macOS

1. Using Homebrew:
    ```sh
    brew install awscli
    ```

2. Or using pip:
    ```sh
    pip install awscli
    ```

#### On Linux

1. Using the package manager (Ubuntu/Debian):
    ```sh
    sudo apt-get update
    sudo apt-get install awscli
    ```

2. Or using pip:
    ```sh
    pip install awscli
    ```

### Step 2: Configure AWS CLI

After installing, configure the AWS CLI with your credentials:

```sh
aws configure
```

You will be prompted to enter the following information:

- AWS Access Key ID: (Your access key ID)
- AWS Secret Access Key: (Your secret access key)
- Default region name: (Your preferred region, e.g., us-west-2)
- Default output format: (Your preferred output format, e.g., json)

You can also edit the configuration manually in `~/.aws/config` file.

### Step 3: Using AWS CLI

Here are some common AWS CLI commands. They are seperated into services. 

#### 1. EC2
An EC2 (instance) is virtual computer, located in AWS data center.
- **List all instances:**
    ```sh
    aws ec2 describe-instances
    ```

- **Start an instance:**
    ```sh
    aws ec2 start-instances --instance-ids i-1234567890abcdef0
    ```

- **Stop an instance:**
    ```sh
    aws ec2 stop-instances --instance-ids i-1234567890abcdef0
    ```

- **Launch a new instance:**
    ```sh
    aws ec2 run-instances --image-id ami-0abcdef1234567890 --count 1 --instance-type t2.micro --key-name MyKeyPair --security-group-ids sg-12345678 --subnet-id subnet-12345678
    ```

#### 2. S3

- **List all buckets:**
    ```sh
    aws s3 ls
    ```

- **Create a bucket:**
    ```sh
    aws s3 mb s3://my-bucket
    ```

- **Upload a file:**
    ```sh
    aws s3 cp myfile.txt s3://my-bucket/
    ```

- **Download a file:**
    ```sh
    aws s3 cp s3://my-bucket/myfile.txt myfile.txt
    ```

#### 3. IAM

- **List users:**
    ```sh
    aws iam list-users
    ```

- **Create a user:**
    ```sh
    aws iam create-user --user-name my-user
    ```

- **Attach a policy to a user:**
    ```sh
    aws iam attach-user-policy --user-name my-user --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
    ```

### Step 4: Automation with Scripts

You can create scripts to automate AWS tasks. Here’s an example of a script to stop all instances:

```sh
#!/bin/bash
instances=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output text)

for instance in $instances; do
  aws ec2 stop-instances --instance-ids $instance
done
```

Save this script as `stop_all_instances.sh`, then run it:

```sh
bash stop_all_instances.sh
```

### Step 5: Documentation and Support

AWS CLI has extensive documentation. You can refer to the official documentation [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html).

Using the AWS CLI allows you to manage AWS services efficiently and automate many tasks, improving your workflow significantly.