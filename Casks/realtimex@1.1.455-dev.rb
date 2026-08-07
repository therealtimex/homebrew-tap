cask "realtimex@1.1.455-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.455-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1eb7dc071b9784da6d9af414efe4d442216f064add8692856df792c6321aa227",
         intel: "3b95b1e93af72627361f9d167258910cce3e30e7dbbfb6a6c8a4bc25606adeef"

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
