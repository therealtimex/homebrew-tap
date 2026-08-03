cask "realtimex@1.1.418-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.418-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6de9eeeb32d3566af2741d6fe0cbad9cfffc9a50450f2de238e86cc3e36ace80",
         intel: "29c03e02f3b7679eeac90659d1f2cee983b6a1e45f595b9d4804bcdd9c850c61"

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
