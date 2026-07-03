cask "realtimex@1.1.173-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.173-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "64451e1e78e456d99c33b3f7b9fcd90b640d794f930ad1d5f6bbcc4f158f5034",
         intel: "ad569b271c834ede96a82e75bfb269205022834d89f36c27b0809da5fa6cdb2e"

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
