cask "realtimex@1.1.51-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.51-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "67180dd78f443eac4c5e12c518911437899c8154ce0b9fd3993cf240c5fe4e64",
         intel: "3aee4f2e9c484070af6898989cd75ca8f79c1c87cb1df76ae4a61f5706e8be26"

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
