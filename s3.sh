#!/bin/ash
aws s3 sync ${ORIGIN} s3://${DESTINATION}
