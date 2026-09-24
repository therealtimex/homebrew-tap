cask "realtimex@1.1.657-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.657-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "56bdaefe87c93cd4e2f7f391111f95d0e51265389e75eb0a4585edb8704635af",
         intel: "fe73d4d38f28d2c9e7aedcca371317608c042595067801e8a9c51ff9cc1dbe3a"

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
