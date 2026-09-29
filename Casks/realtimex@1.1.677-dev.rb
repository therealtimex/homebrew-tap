cask "realtimex@1.1.677-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.677-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2af845b8360ba3150eef9f6fe5aae1fb8e0abce235a3da54df6710026df67fdd",
         intel: "8641d27814ee2a5cc5bd6a4bf5d217d489c5f14ce1e949eb73dfb1491692ee22"

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
