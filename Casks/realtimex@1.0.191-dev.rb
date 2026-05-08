cask "realtimex@1.0.191-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.191-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5cd700710fdd137ad76a7c793ac715b6926a5ab37d6c95f8ae67e551e8aa0bc0",
         intel: "8f00cff827e321ef03dda5000e29a4f13fd53123a74580ee65c2d8027b115256"

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
