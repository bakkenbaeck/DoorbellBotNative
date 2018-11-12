#!/usr/bin/ruby

# Information specific to the Wallet app
class Properties

  # The username for an Apple account that can log in to the Apple Developer portal and iTunes Connect
  Username = "FIXME"

  class TeamId
    # The Apple developer portal team ID for development/distribution via App Store
    Developer = "FIXME"
  end

  # The names of build schemes available for build actions
  class BuildScheme
    Distribution = "DoorbellBotNative_Two"
  end

  class Target
    Distribution = "DoorbellBotNative"
  end

  # Information specific to this app's branch and repo for Match.
  class MatchInfo
    RepoUrl = "FIXME"
    Branch = "FIXME"
  end

  class ProjectInfo
    RepoUrl = "FIXME"
  end

  # All bundle identifiers for this application and its assorted extensions.
  class BundleIdentifier
    Distribution = "com.bakkenbaeck.Doorbell-bot-Native"
  end

  class File
    ProjectFile = "iOS/DoorbellBotNative.xcodeproj"
    WorkspaceFile = "iOS/DoorbellBotNative.xcworkspace"
  end

end
