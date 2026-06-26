cask "realtimex@1.1.142-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.142-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6a74bcf2e8db8a338126c547d1db201447e54846edd21870997a1638bdfcec67",
         intel: "3b17bf5d00d0876ce3c583c77f207cb28a31306d928946965dd39d76b3fee6ec"

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
