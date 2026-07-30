cask "realtimex@1.1.391-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.391-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8aa7b1f16d2ad8540fab3b68dd0d223af170b5f8918390edf222af45f70e1588",
         intel: "61196ed3fa9ae0ca8d284c116687defd5cc330e0a279a858bfa5872006b3e0f3"

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
