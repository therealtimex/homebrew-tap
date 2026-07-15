cask "realtimex@1.1.251-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.251-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f372c4d1a6d905f5c1de62a4a40b9472df41989cb358146886a46b623ba3cce2",
         intel: "3e7e3eb165881b04a7ef7b28259495cd0ed8945bffb3ea4c131db6dbf711aa43"

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
