cask "realtimex@1.2.92-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.92-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6c4dc8154d98623418b4ee44c39c90d45a8f42fc4a659a0e5097e6bdefd7e1dd",
         intel: "4e362b51074341f56deff7bd99ed1272a00769e0d6fab8a26fec4ac786952e11"

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
