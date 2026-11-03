cask "realtimex@1.2.176-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.176-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "188ad635c5850f7e36584d820f6058f070425891131082bf0b62f435993abbd3",
         intel: "7a4c474043455be25da6a1b296233c45f06f1468724bbd01c4708328e507ee98"

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
