cask "realtimex@1.2.23-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.23-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5449a518ee719fd8dd3450d2a8d5a091c927d44e9576d732915f345d6b9d4443",
         intel: "a75c2dd492a89a3c4f03d1d5fd6fb791a84c5483ee23420e68a155f10f088dc9"

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
