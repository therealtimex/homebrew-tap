cask "realtimex@1.1.357-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.357-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ed915da8d265929f06c3a0895f8f4b01e2f743c52e4170c4d47c0767e8e2302d",
         intel: "05d28b87bf2e200aaf0a58bb2ef3afa29c9b68b939edd985b9305ce137e5a1f8"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit']
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
