cask "realtimex@1.1.70-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.70-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ae3140fd37dce5da82cf5934d963dd08fd5877167b1b724deca9f54d44e1b578",
         intel: "39ef0d4df71a01af84a0b2483943d92c0b6e11fe5fd4d38551277819697135b6"

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
