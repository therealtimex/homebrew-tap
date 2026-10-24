cask "realtimex@1.2.110-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.110-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d2efc7127e940248d059f88e2d9af0d2ff46643bcada6cd70cd6ceeda12f32de",
         intel: "219700b932b560b6fb3d4e80d292dda719e04fcf1360518cfe590bb6542968ee"

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
