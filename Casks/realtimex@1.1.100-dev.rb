cask "realtimex@1.1.100-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.100-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "61152d622bcdd35ccdc62aa75f77802707cd33d3003df35b537e1f75f5710e55",
         intel: "9edb2b9b9591b8506f46008483367acbcab54c6787f9fdc199747d6c526556fc"

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
