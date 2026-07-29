cask "realtimex@1.1.379-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.379-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bf9b7dab5d1c8bc60b189c09c8b80ab634479ac13e30bc01635ab49d6faff406",
         intel: "40ce387624835c2fe0024f3f4637e1dfe51618296b2d3337677a439ca901d3b5"

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
