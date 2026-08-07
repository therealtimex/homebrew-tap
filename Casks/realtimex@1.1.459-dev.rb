cask "realtimex@1.1.459-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.459-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bea44507f50fb708c2d29f94461a2007eaa576be32134a98b6a6be2a753f62c7",
         intel: "ecfe44be127616e96af8c41b0efbb45e6d5a2279bd69562c2ebe495e98ca6f17"

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
