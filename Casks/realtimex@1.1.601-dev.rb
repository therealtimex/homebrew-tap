cask "realtimex@1.1.601-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.601-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "564b6cea2d95bc7ae6bab5454cc91a29ebc7556fbc03af7f63a4fb68fa399d83",
         intel: "f8a9d910ab189277b8b9210ea5ef92b0918e3e662dd952260ca7f2cdf54e2be1"

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
