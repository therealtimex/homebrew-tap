cask "realtimex@1.2.247-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.247-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3aa90e1348fc7fa98f9dfa1cb5435893d66e4cd9f471d96272286dfbef78dee1",
         intel: "19573b45a11b2b1067c5290824f07d30cab1e3585f7c419f1d63b33a5e575508"

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
