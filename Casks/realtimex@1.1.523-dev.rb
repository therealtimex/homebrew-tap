cask "realtimex@1.1.523-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.523-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9fd352433dc397f2a91fce1eca1981a84c1fcc4e5cbcd8adc1955003e4d97dbd",
         intel: "ca136420ad4f82348c17e197674e5e37a941490276ea72dd9f20aa94d835d8f0"

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
