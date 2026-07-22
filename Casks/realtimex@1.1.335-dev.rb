cask "realtimex@1.1.335-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.335-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "41bbb1a9dc9336ff5df9ab3d60c4ccb0bb426c8d2213f6db030164f1438421a8",
         intel: "9538f8c6aa35af5456919a7428d8a2ae5e02eaa47054350aa073342f297b92bb"

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
