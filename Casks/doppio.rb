cask "doppio" do
  version "0.2.2"
  sha256 "22cb026911edb752cf03b3f25ac77945521c91a81583120c96a1abe9afcc823d"

  url "https://github.com/relyweb/doppio/releases/download/v#{version}/Doppio.zip",
      verified: "github.com/relyweb/doppio/"
  name "Doppio"
  desc "Prevents sleep for Claude Code, omp, and other agentic tasks"
  homepage "https://github.com/relyweb/doppio"

  depends_on macos: :ventura

  app "Doppio.app"

  # The app is ad-hoc signed (not notarized). Gatekeeper quarantines downloaded
  # unsigned apps, so strip the flag on install; otherwise the first launch is
  # blocked until the user approves it under System Settings > Privacy & Security.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Doppio.app"],
                   sudo: false
  end

  # Tear down the privileged lid-closed helper that "Allow When Lid Closed"
  # installs, so a root LaunchDaemon is never left behind after uninstall.
  # `launchctl` unloads the daemon; `delete` removes the root-owned files
  # (Homebrew elevates with sudo as needed).
  uninstall launchctl: "com.doppio.keepawake.lidhelper",
            quit:      "com.doppio.keepawake",
            delete:    [
              "/Library/Application Support/Doppio",
              "/Library/LaunchDaemons/com.doppio.keepawake.lidhelper.plist",
            ]

  zap trash: [
    "~/.doppio",
    "~/Library/Preferences/com.doppio.keepawake.plist",
  ]
end
