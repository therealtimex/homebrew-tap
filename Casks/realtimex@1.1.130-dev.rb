cask "realtimex@1.1.130-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.130-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d31c17ea71df8f83b78b766b2bd5f8373921388c8ee0812f71e93b5990d3e81c",
         intel: "ffb39af867eb33f569e53eb5719ac04673e9353c409f0b8a8ccf82fc937559b7"

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
