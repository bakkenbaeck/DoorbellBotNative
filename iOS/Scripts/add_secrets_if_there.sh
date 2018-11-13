#!/bin/sh

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
FILE="$SOURCE_DIR/add_secrets_to_env.sh"

echo "FILE: $FILE"

if [ -f $FILE ]; then
  echo "Environment exists, running..."

  # Get the secrets into the environment
  source "$FILE"
else
  echo "File does not exist - hope you added things in Circle's private keys!"
fi

PARENT_DIR=$(DIRNAME $SOURCE_DIR)

echo "PARENT $PARENT_DIR"
FIREBASE_PLIST="$PARENT_DIR/DoorbellBotNative/GoogleService-Info.plist"

echo "FIREBASE_PLIST $FIREBASE_PLIST"

/usr/libexec/Plistbuddy -c "Set :AD_UNIT_ID_FOR_BANNER_TEST $FIR_AD_UNIT_ID_FOR_BANNER_TEST" "$FIREBASE_PLIST"
/usr/libexec/Plistbuddy -c "Set :FIR_AD_UNIT_ID_FOR_BANNER_TEST $FIR_AD_UNIT_ID_FOR_INTERSTITIAL_TEST" "$FIREBASE_PLIST"
/usr/libexec/Plistbuddy -c "Set :API_KEY $FIR_API_KEY" "$FIREBASE_PLIST"
/usr/libexec/Plistbuddy -c "Set :BUNDLE_ID $FIR_BUNDLE_ID" "$FIREBASE_PLIST"
/usr/libexec/Plistbuddy -c "Set :CLIENT_ID $FIR_CLIENT_ID" "$FIREBASE_PLIST"
/usr/libexec/Plistbuddy -c "Set :DATABASE_URL $FIR_DATABASE_URL" "$FIREBASE_PLIST"
/usr/libexec/Plistbuddy -c "Set :GCM_SENDER_ID $FIR_GCM_SENDER_ID" "$FIREBASE_PLIST"
/usr/libexec/Plistbuddy -c "Set :GOOGLE_APP_ID $FIR_GOOGLE_APP_ID" "$FIREBASE_PLIST"
/usr/libexec/Plistbuddy -c "Set :PROJECT_ID $FIR_PROJECT_ID" "$FIREBASE_PLIST"
/usr/libexec/Plistbuddy -c "Set :REVERSED_CLIENT_ID $FIR_REVERSED_CLIENT_ID" "$FIREBASE_PLIST"
/usr/libexec/Plistbuddy -c "Set :STORAGE_BUCKET $FIR_STORAGE_BUCKET" "$FIREBASE_PLIST"
/usr/libexec/Plistbuddy -c "Save" "$FIREBASE_PLIST"

# Uncomment to make sure this is working
#/usr/libexec/Plistbuddy -c print "$FIREBASE_PLIST"
