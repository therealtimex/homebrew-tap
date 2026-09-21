cask "realtimex@1.1.642-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.642-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cf24750c7fe350cd59be1f7978d0b62d9b14e834b414fdd91134da28681f6345",
         intel: "73d02268530a5430e90c204e4a8cbde9d9f2773875927b70b0ca6d9e1e7f6ff8"

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
