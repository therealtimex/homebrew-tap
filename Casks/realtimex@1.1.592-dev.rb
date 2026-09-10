cask "realtimex@1.1.592-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.592-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "74daf8dc95dfd779d3b81c8c733cd6501962fb2c8b7f544e8c25d977f4d54beb",
         intel: "e5df1bef398d327d2c4e34a65365c555d79665dc5d1ac11b619cf760c2f38d73"

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
