cask "realtimex@1.1.180-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.180-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f6e5098ee46e4ca83bbbea8a1fdb4cc89acb63272f4c86a04cb82360e0944f7b",
         intel: "300d847a153b5dbd9e8bc7316b41684942b2904b551c31e691d270c91e37d244"

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
