cask "realtimex@1.1.531-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.531-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5637a66cd2bce58139631ebd2eb6b4e9f089b5a76e2a7032ddfe9b846260d31c",
         intel: "a6c37c481fbc9c91b557e852bbe150a100650736b4a444dbffb22d6ea0136052"

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
