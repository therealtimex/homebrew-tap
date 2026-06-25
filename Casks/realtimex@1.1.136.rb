cask "realtimex@1.1.136" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.136"

  # Provide both SHA256 hashes
  sha256 arm:   "32cd1050c285880654f2d22ee143a07d5e1a0b0dd4693688773a2dedfd283367",
         intel: "d6c10e22645873f179803b562a9d9573f2903de1e45df0cc7ca63b4bf33bd0ba"

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
