cask "realtimex@1.1.192-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.192-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "19f5cccdca6f8b5ee493594d00231b539c2660e07235fe5f89b45743e16dab38",
         intel: "e49cd93dede12e2003fb197c9af8848b403fc39f178f76110223428fe4af93bc"

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
