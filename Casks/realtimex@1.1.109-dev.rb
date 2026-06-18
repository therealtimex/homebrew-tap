cask "realtimex@1.1.109-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.109-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "52753fdb8f3b1fbf9410a5a2f8a1fef5535072ad29b7c6c3c075ebeeeb00af63",
         intel: "6ece51bf443f61a06628faa3eed7fcdd093875c4b0a7623f1dda615213bb2d15"

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
