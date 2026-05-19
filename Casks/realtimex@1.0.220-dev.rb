cask "realtimex@1.0.220-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.220-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "99effc4eab4ef6422919b8d96642ea8c0cd6c7a7441c85d98a26169959111b56",
         intel: "00a0b4791687b271661ecd0b2bf604c0c07096d000c894faf007be079e6f97ce"

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
