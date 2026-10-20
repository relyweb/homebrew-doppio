cask "doppio" do
  version "0.4.0"
  sha256 "819804a1144d68b3a2cba9c5791db629e80bf225937f56ee1ce9653bfad356d9"

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
