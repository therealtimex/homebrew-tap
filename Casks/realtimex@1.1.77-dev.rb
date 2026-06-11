cask "realtimex@1.1.77-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.77-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "891e12f5e50b5f15a2d1f72002fc709043988b2df8d9bbc1be369048a063b5f6",
         intel: "f7c87775390775c0bc780f062e9c1a98a74b57d2031275106bb8f0b9e6e0348f"

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
