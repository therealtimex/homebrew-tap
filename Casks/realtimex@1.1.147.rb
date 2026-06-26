cask "realtimex@1.1.147" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.147"

  # Provide both SHA256 hashes
  sha256 arm:   "9dea8180de8609be6e9b49c56ae47a2833a37e9afa23f67d7501cfc1e885817e",
         intel: "859f78bad567a6f23d7784c3d9cfe1d4119e7dd13fde239f05be47a3888ac825"

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
