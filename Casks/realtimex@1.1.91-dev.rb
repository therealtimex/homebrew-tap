cask "realtimex@1.1.91-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.91-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d5da0c32a77a0373f807e5e885178830911c184a67dad675a62d9520487c205f",
         intel: "1541db176bbcfa210e977f971e176ccf8707fe8e7ec3e4c4782df6614afcb8ee"

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
