cask "realtimex@1.2.259-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.259-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9ab36ab07c2f72454d5337ac6a3cdf1bb92f1002b9601ef844cb0431772e77b1",
         intel: "06d70d3f6532d8b6e6b44e97ea0a8432fcf121b7b9379484e44bc7cfe3fa8c8d"

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
