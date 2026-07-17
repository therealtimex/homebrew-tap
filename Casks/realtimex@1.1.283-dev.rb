cask "realtimex@1.1.283-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.283-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1f0196f519d60e67dd4b6f35e01acbff28d1f979e4dab0ba178f330ac3be7823",
         intel: "b4da20261b9e2f4b7ed37f7e602ce37d6d54719c843cd947c355e4c6540fd053"

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
