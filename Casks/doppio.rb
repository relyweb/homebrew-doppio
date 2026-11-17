cask "doppio" do
  version "0.4.1"
  sha256 "2213ae6c0f2d7eb91cc5a4e91f62fc77adddb1207db6e7902eff347121169bce"

  url "https://github.com/relyweb/doppio/releases/download/v#{version}/Doppio.zip"
  name "Doppio"
  desc "Prevents sleep for Claude Code, omp, and other agentic tasks"
  homepage "https://github.com/relyweb/doppio"

  depends_on macos: :ventura

  app "Doppio.app"

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
