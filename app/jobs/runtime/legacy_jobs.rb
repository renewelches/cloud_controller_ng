# It's important to keep around old jobs names since there might be queued jobs with these older names
# in a deployment out there. This is especially important for on-prem deployments that might not regularly
# update CF.

AppBitsPackerJob = VCAP::CloudController::Jobs::Runtime::AppBitsPacker
BlobstoreDelete = VCAP::CloudController::Jobs::Runtime::BlobstoreDelete
BlobstoreUpload = VCAP::CloudController::Jobs::Runtime::BlobstoreUpload
DropletDeletionJob = VCAP::CloudController::Jobs::Runtime::DropletDeletion