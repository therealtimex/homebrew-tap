cask "realtimex@1.1.328-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.328-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b152805f31329960fd62fbe22b38eb66d8ec8670e66c6fddfbcf72b68d228d18",
         intel: "a2733feb2ced7c376e75e5dee1ad6efa22f405ae22ebdc8acd27ab99dd4437b1"

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
