cask "realtimex@1.1.34-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.34-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f585c0e308ed0a851a160b3536422802447d881c5f4817ad07006e362a43652b",
         intel: "46e4b24b7ba8bd93ec773197f03b62c6e6463b26d1f8d9e4e26a625997b2a134"

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
