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

- The `GoogleService-Info.plist` file, which is ignored in git to avoid leaking credentials. If you're building this project outside the Bakken & Bæck organization, you'll need to create your own Firebase project [here](https://console.firebase.google.com). 