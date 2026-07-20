cask "realtimex@1.1.319-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.319-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "86433ca46b49aa8f6a2ba13681bb960f9e56fd6857f50c935c691f0e448682df",
         intel: "a3247eb3565ac713c41b396bba73985d2694b319a326b2ca0ebe60334dff149c"

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
