cask "realtimex@1.2.151-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.151-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "67d3156a63b896486aaf5378d98c2da6658139a85270d3b1cf8ee2e083ad7b6e",
         intel: "453ba717d5d9ae67e74aab0d31c5af1fab70663bf8c74a2098ed48168299342c"

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
