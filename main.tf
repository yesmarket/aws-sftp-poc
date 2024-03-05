resource "aws_transfer_server" "this" {
  identity_provider_type = "SERVICE_MANAGED"
}

resource "aws_iam_role" "this" {
  name = "tf-transfer-user-iam-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "transfer.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "this" {
  name = "tf-transfer-user-iam-policy"
  role = aws_iam_role.this.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowFullAccesstoS3",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

resource "aws_transfer_user" "ryan" {
  role                = aws_iam_role.this.arn
  server_id           = aws_transfer_server.this.id
  user_name           = var.username
  home_directory_type = "PATH"
}

resource "aws_transfer_ssh_key" "ssh_key" {
  server_id = aws_transfer_server.this.id
  user_name = var.username
  body      = var.ssh_public_key
}
