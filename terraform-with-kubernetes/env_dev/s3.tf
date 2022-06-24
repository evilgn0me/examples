resource "aws_s3_bucket" "test" {
  bucket = lower("${var.project_name}-lambda-poster-${var.env_name}")
  acl    = "private"

  tags = {
    Name = "S3 bucket for ${var.env_name}"
  }
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "s3-access-policy-${var.env_name}"
  path        = "/"
  description = "Policy to access s3 bucket from ${var.env_name} eks cluster"

  policy = jsonencode({
      "Statement": [
          {
              "Action": [
                  "s3:GetObjectVersionTagging",
                  "s3:GetStorageLensConfigurationTagging",
                  "s3:GetObjectAcl",
                  "s3:GetBucketObjectLockConfiguration",
                  "s3:GetIntelligentTieringConfiguration",
                  "s3:GetObjectVersionAcl",
                  "s3:GetBucketPolicyStatus",
                  "s3:GetObjectRetention",
                  "s3:GetBucketWebsite",
                  "s3:GetJobTagging",
                  "s3:GetMultiRegionAccessPoint",
                  "s3:PutReplicationConfiguration",
                  "s3:PutObjectLegalHold",
                  "s3:GetObjectLegalHold",
                  "s3:GetBucketNotification",
                  "s3:DescribeMultiRegionAccessPointOperation",
                  "s3:GetReplicationConfiguration",
                  "s3:ListMultipartUploadParts",
                  "s3:PutObject",
                  "s3:GetObject",
                  "s3:DescribeJob",
                  "s3:GetAnalyticsConfiguration",
                  "s3:GetObjectVersionForReplication",
                  "s3:GetAccessPointForObjectLambda",
                  "s3:GetStorageLensDashboard",
                  "s3:GetLifecycleConfiguration",
                  "s3:GetInventoryConfiguration",
                  "s3:GetBucketTagging",
                  "s3:GetAccessPointPolicyForObjectLambda",
                  "s3:GetBucketLogging",
                  "s3:ListBucketVersions",
                  "s3:ListBucket",
                  "s3:GetAccelerateConfiguration",
                  "s3:GetBucketPolicy",
                  "s3:GetEncryptionConfiguration",
                  "s3:GetObjectVersionTorrent",
                  "s3:GetBucketRequestPayment",
                  "s3:GetAccessPointPolicyStatus",
                  "s3:GetObjectTagging",
                  "s3:GetMetricsConfiguration",
                  "s3:GetBucketOwnershipControls",
                  "s3:GetBucketPublicAccessBlock",
                  "s3:GetMultiRegionAccessPointPolicyStatus",
                  "s3:ListBucketMultipartUploads",
                  "s3:GetMultiRegionAccessPointPolicy",
                  "s3:GetAccessPointPolicyStatusForObjectLambda",
                  "s3:GetBucketVersioning",
                  "s3:GetBucketAcl",
                  "s3:GetAccessPointConfigurationForObjectLambda",
                  "s3:GetObjectTorrent",
                  "s3:GetStorageLensConfiguration",
                  "s3:PutObjectRetention",
                  "s3:GetBucketCORS",
                  "s3:GetBucketLocation",
                  "s3:GetAccessPointPolicy",
                  "s3:GetObjectVersion"
              ],
              "Effect": "Allow",
              "Resource": [
                  "${aws_s3_bucket.test.arn}",
                  "${aws_s3_bucket.test.arn}/*",
              ]
          }
      ],
      "Version": "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "s3_to_lambda_access" {
  policy_arn = aws_iam_policy.s3_access_policy.arn
  role       = aws_iam_role.iam_for_lambda.name
}