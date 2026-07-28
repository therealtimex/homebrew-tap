cask "realtimex@1.1.377-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.377-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c6c650916ef66f1add0933c14c0ff9323545b90d15d5c8edb3703e2f6fba7953",
         intel: "39ff925c35200eef375b9debae474b27703899544882308ad71fd70b9999f043"

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
