cask "realtimex@1.1.255-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.255-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9c675abb34c01f8a0b5806c59ad15f2f64f8acb15cfabd004cf05d6141904f19",
         intel: "15ae8b4e7890b3c88d86ba3154f0e72f93f3098251c1bd627835d30c37a6231c"

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
