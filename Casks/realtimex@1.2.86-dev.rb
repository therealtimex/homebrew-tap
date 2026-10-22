cask "realtimex@1.2.86-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.86-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3da2132cd1d8c950c687c22e47379ef0f05b687d8ea971dad97dd29e654edf37",
         intel: "19f6908b319bf2053d07a30c2c41336e0ecc5e1f8ce15605c3ad2a4fc429bcc1"

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
