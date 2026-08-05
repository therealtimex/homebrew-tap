cask "realtimex@1.1.433-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.433-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c7d22349ac934decebc192a1a5d5d4a4cbb34c439d53038e9933d5283ab20680",
         intel: "85efe79cd4208c9bddc3ee2b85c140305188103cdd987aac471d7a203ababcf3"

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
