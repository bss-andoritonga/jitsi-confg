#!/bin/bash
set -x

RECORDINGS_DIR=${1?param missing directory}
EKYC_SERVER=${EKYC_SERVER:-https://sandbox-ekyc-api-n2fstmkpta-et.a.run.app}

echo $RECORDINGS_DIR > /tmp/finalize.out

metadata=$(find $RECORDINGS_DIR -iname "metadata.json" ) 
video=$(find $RECORDINGS_DIR -iname "*.mp4" ) 

echo $metadata
echo $video
curl -F metadata=@$metadata -F video=@$video $EKYC_SERVER/api/public/jitsi/upload

exit 0