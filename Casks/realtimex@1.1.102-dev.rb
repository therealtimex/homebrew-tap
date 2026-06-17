cask "realtimex@1.1.102-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.102-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e85d00376951e2a45d956587622ee75f68f616585b8b4e6050a5fa5f1ad95f2d",
         intel: "eddf3821abbf99ae63f7456d1096cf6bde5c78913ae79f3b391af135f0392d44"

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
