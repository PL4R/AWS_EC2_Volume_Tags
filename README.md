# AWS EC2 EBS tag management script
This shell script is used to manage AWS EC2 instance EBS volume tags to ensure that tags were consistent for reporting purposes, as the business was split into multiple SBUs.
The tags that this script is managing are called "Category" & "SBU", but I'm sure you can hack this script to do what you want ;)

I'm sure there is a far more elegant way of doing this this, but time was at a premium and it did the job.

## Prerequisites

- Linux host
- AWS cli tools
- AWS access key id/secret access key configured via 'aws configure' for the user to run this script

## How to

- Clone this repo
- Put script wherever you wish & make executable
- Create cron entry to run this script once per day
- Create tags against your EC2 instances that you want to manage;
  - If you've deviated from tags "Category" & "SBU", then you'll need to edit the code.
