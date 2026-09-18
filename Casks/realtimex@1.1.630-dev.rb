cask "realtimex@1.1.630-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.630-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ee76289462dd3da65433c097b32b3665728db9110c7175280803cfbfd85f0d7c",
         intel: "e5dd7921cf514bc840a0213891d1bf878967793b778eb93dfdb0d19bd4a6774e"

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
