https://www.oss-group.co.nz/blog/automated-certificates-aws

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicRead",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::forensic-development/*"
        }
    ]
}

{
    "Version": "2012-10-17",
    "Id": "http referer policy example",
    "Statement": [
        {
            "Sid": "Allow get requests originating from https://violentlegalities.space",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::forensic-development/*",
            "Condition": {
                "StringLike": {
                    "aws:Referer": [
                        "https://violentlegalities.space/*",
                        "http://www.violentlegalities.space/"
                    ]
                }
            }
        }
    ]
}

{
    "Version": "2012-10-17",
    "Id": "http referer policy example",
    "Statement": [
        {
            "Sid": "Allow get requests originating from https://violentlegalities.space",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::forensic-development/*",
            "Condition": {
                "StringLike": {
                    "aws:Referer": [
                        "https://violentlegalities.space/*",
                        "http://www.violentlegalities.space/"
                    ]
                }
            }
        }
    ]
}