 #!/usr/bin/env bash
 terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.22.0"
    }
  }
}

resource "aws_s3_bucket" "default" {  
}

resource "aws_s3_object" "object" {
  bucket = resource.aws_s3_object.default
  key    = "myfile.txt"
  source = "myfile.txt"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  # etag = filemd5("path/to/file")
}