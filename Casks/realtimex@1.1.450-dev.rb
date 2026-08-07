cask "realtimex@1.1.450-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.450-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cb11b61f5a65dae4814463fa9a874cbe478733cdf6cfbd7fd81e1d8035bc5b77",
         intel: "9993a5ed99cd9bd8dc256c533b6555f5f3f58670d5f592ee3090e3cad7e84ba1"

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
