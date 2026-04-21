cask "realtimex@1.0.148-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.148-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "94ca81a91e49631a378d3e5c6766921334cdd290db06e2b131d84d401c1e619e",
         intel: "b290ee5ed1e768638ba0685d65647da5046d5397924a0596afad52ef716bc6a5"

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
