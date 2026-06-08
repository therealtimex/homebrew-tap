cask "realtimex@1.1.56-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.56-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "257543e66268d1b966d4412f2c044c20bfaf3695f6b9744581211959de6347d3",
         intel: "fa803004ec75a6dc2f9d9696e297d2cdf521e9f96a480e35fdec11fac82ca8a9"

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
