cask "realtimex@1.2.106-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.106-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9293404b4a7236a2a000027ae84843ec8321340692e23cb2c272149a5b8862d2",
         intel: "46870421a250d810b1e036c20d8c4cc87ddc0bdd0325980d88e0f8db836efa28"

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
