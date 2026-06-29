cask "realtimex@1.1.156-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.156-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "eb7feaec89e31a145227b912ae57d8458b2c885dca25edc7e782be888c911e95",
         intel: "ddc18bb1c68d0929dd0a6b6eb4654078c0d2c7352d8e512b7a71a17c358b000b"

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
