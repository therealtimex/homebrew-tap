cask "realtimex@1.2.0" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.0"

  # Provide both SHA256 hashes
  sha256 arm:   "49ce8f0cf53a2f8f79a0d2cbb2df692a954524e6370ac141764c1f184952f14e",
         intel: "31a9add0b44b3fd86fd50a739b147f3b238976fc1a16292ba101abb42446383f"

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
