# DoorbellBot Native

A [Kotlin/Native](https://kotlinlang.org/docs/reference/native-overview.html) app to open the door using Slack and a Raspberry Pi. 

# Things You Need

## Overall

- Gradle ([Installation instruictions](https://gradle.org/install/))
- [Android Studio](https://developer.android.com/studio/) or IntelliJ to work with Kotlin, the Android app, and Kotlin Native. 
- The Kotlin/Native compiler. This *should* download automatically via gradle when you attempt to do a gradle build (note: This will take...a while)
- [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12), to compile the iOS version of the framework and the iOS app. 

## Android

- To come!

## iOS

- The `Scripts/add_secrets_to_env.sh` file (which is ignored from git to avoid leaking secrets). This includes secrets for Firebase Crashlytics. 

  If you are poking at this app via open source and wish to use a different Firebase account:   
  - Replace the [iOS/DoorbellBotNative/GoogleService-Info.plist](iOS/DoorbellBotNative/GoogleService-Info.plist) file with your own. 
  - Remove the `Embed secrets` and `Reset Secrets For Later` phases from the build script. 