cask "realtimex@1.0.201-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.201-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3ee7a0e384f247e65c8e9734d079920784e1f8b6829780db27d231ba1e1295bf",
         intel: "d012045b2949d84dd4e9ecb7fa51f08bd3146f18b581de599587631602171dd6"

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
