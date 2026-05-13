cask "realtimex@1.0.204-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.204-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "40f68d15b101ecae076e3e89e6defc6e6c5989dc6922d5ad6700c875ad181242",
         intel: "9bd33283f79f54bb83186f366fc45b803735266a369cfe79695a38325da8a6dd"

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
