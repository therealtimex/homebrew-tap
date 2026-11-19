cask "realtimex@1.2.267-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.267-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "60485dee403441d319385917fb4510b167491d10cda113f05c90b679a1f1f9aa",
         intel: "d3dfd2e538561c5971baaa86b2c9c67fec071b1d878ab6df40410352e6dd5ebc"

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
