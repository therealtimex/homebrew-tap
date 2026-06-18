cask "realtimex@1.1.107-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.107-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "72bb1088b765f86226e78d6670476ab08b7d7620971c81ec97ac953e9d79c510",
         intel: "05267d02bc3a84315222225d0121acc3fb6db379c1098002b18bc5853cce15d0"

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
