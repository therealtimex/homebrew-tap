cask "realtimex@1.0.241-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.241-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ee2443b114d571832245054da301179dd70f629ea14e364146610bd23ceaeb1a",
         intel: "65e1928a3368f36cd0cd187a11729dd0cf7499d2d59b8052b3cebe6e1d9ef700"

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
