cask "realtimex@1.1.461-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.461-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f4baf9dbe71003edc0d5bda2c9fe44c456efde8cdabb5e22f144821e639c2eeb",
         intel: "33238df692722bf959a67737214ff56ce3100a4535cb8cb99483de547116ccdf"

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
