cask "realtimex@1.1.649-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.649-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d05b2b24affabcfaec84753c86a4224ccc153ce03cc8d40346bbfc0cbc21b3c8",
         intel: "b7150e8daa201c49d1a4e585ee8125efa4bc656aa7d329d93ff4c370646c05a1"

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
