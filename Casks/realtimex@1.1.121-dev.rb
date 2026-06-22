cask "realtimex@1.1.121-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.121-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1c6fd7e90b7ed56a0368111f80a5b2082e974824199b67a5ec38d9c7f53c1b80",
         intel: "9fba1968efa4a6118b9f94d57eff55d0f9901b18bc48c752930d07d24fbf96e5"

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
