
## Create a s3 bucket using module
module "my_s3_bucket_from_module" {
  source = "github.com/raquelsanzseg/s3_module//s3_bucket?ref=v1.0.1"

  bucket_name = "${var.company}-${var.project}-${var.lab_number}"
  versioning  = var.versioning

}
