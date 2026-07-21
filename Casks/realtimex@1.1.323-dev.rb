cask "realtimex@1.1.323-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.323-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ecbad519fe80226617307afa7fbb8e9dc0473728aa0593bed8aeb643cf4a4824",
         intel: "7d267626b53dd34dec60e2865aea84f05e9e6250894af023d2ff6282541bd59b"

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
