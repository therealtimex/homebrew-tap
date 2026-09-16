cask "realtimex@1.1.623-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.623-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0498a07d3ab855d5f5eb35e57a3188d963c9b3b44a95a29e13254c9e85109cb5",
         intel: "39dbd27a3d5ba2983faa12bf445f8e405e18c3f54d63d73218ae1bf7d16940d0"

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
