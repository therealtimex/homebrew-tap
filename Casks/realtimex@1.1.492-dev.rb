cask "realtimex@1.1.492-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.492-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "269d7bc6b873aadcc3ba15e9057b8a733b002a4d49a3ff33ab71323e28c85e73",
         intel: "61fa9fc226139cca063f72eeb3b38902443cd216d31ada24fa82e7d043403975"

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
