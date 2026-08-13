cask "realtimex@1.1.501-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.501-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "92b8a2d3baa3d26ef2b0bc9ea861991ede42fce17eab474b276a507436841d1e",
         intel: "4c64b6e937b7b26734cb313767d4d5c9bcb60ca69604d53dfdfb154290b33ff8"

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
