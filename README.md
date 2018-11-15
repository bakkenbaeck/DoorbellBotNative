# DoorbellBot Native

A [Kotlin/Native](https://kotlinlang.org/docs/reference/native-overview.html) app to open the door using Slack and a Raspberry Pi. 

# Things You Need

## Overall

- Gradle ([Installation instruictions](https://gradle.org/install/))
- [Android Studio](https://developer.android.com/studio/) or IntelliJ to work with Kotlin, the Android app, and Kotlin Native. 
- The Kotlin/Native compiler. This *should* download automatically via gradle when you attempt to do a gradle build (note: This will take...a while)
- [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12), to compile the iOS version of the framework and the iOS app. Make sure the command line tools are installed (usually you can do this by just trying to open Xcode for the first time - you'll be prompted to install the tools). 
- `.secrets` folder for the root of the repo, which is ignored from git to avoid leaking API keys contained therein. See [Open Source Notes](#open-source-notes) for instructions if you are not a member of the core team. 

## Android

- To come!

## iOS

- To come!


# Open Source Notes

Here are some notes about things you'll want to replace if you're using your own accounts.

## Firebase

- On iOS, replace the [iOS/DoorbellBotNative/GoogleService-Info.plist](iOS/DoorbellBotNative/GoogleService-Info.plist) file with your own, and remove the `Embed secrets` and `Reset Secrets For Later` Build Phases from the main app target.
- On Android, (TO COME)