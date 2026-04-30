cask "realtimex@1.0.167-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.167-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7031541967b7d40d853e13707ec0612069305219f236bd6f7f9a52ee542e61d7",
         intel: "d539e511662a63e7c081e2e1810c4cbfebcbd651e7d4c9a5528ae95588b31db1"

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
