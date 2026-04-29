cask "realtimex@1.0.163-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.163-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9df023ee83875aeea9e6e08f9027e80e5a8066d0b6afb6b35def19b6bbf900b4",
         intel: "13345e8455951a25d105aae902ee9fa4258874ea00838d1cb9efde5f5fe4d33b"

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
