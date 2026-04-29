cask "realtimex@1.0.162-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.162-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "72ed9caa3ddaaed06309c99a08de34a7025a306bb06c8886fe7e7ee183140390",
         intel: "a20e43d7622153c75d0f7c8a028f3e2bf888bbf61aa078becab932814f4e63e3"

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
