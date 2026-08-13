cask "realtimex@1.1.504-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.504-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8ec8525428714b26e1a724a868142e5f076e5d657df8c69c3688d203b801867a",
         intel: "9598aa2fe7b075a751cd986edf88780e2af77d0c38064a2f5bd1a6d07245c79a"

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
