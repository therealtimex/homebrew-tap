cask "realtimex@1.2.13-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.13-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "21583caa09e07976b9dd0ed1086d943d3a58161a9ab8781c88d58d591ded558b",
         intel: "d6528104e27a6a9eea8654a8705b92b549ec2a2cb8539f8addad42b9f2d73e00"

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
