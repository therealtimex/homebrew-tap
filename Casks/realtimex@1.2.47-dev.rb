cask "realtimex@1.2.47-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.47-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e865fc4ba285dca3868b877df982b368dad0a772e04c8e234961fd88f9ed67bc",
         intel: "6a1a304836e91b3af107e314d3a43be5c3bf97be11a89ebfbd05c566104be654"

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
