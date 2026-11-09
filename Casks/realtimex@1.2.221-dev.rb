cask "realtimex@1.2.221-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.221-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2edf2cd30dd1745d70d65a8fdbbf76d6c851452113aad1a087382d60ed5dcfe2",
         intel: "7ac212f90ac1722cbabc4041b9cdbaa6e5415d3f0f9e1d1f3ffc160a412af4de"

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
