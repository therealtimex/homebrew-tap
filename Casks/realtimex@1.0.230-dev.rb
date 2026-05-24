cask "realtimex@1.0.230-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.230-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "631e6703881bfc8b556b77290a8215c0cd20596b9594c1d3d67c6cc14aecd53d",
         intel: "f95e6afa83c9b69e9dab4ef65f03da6084a984bc71e4f8b4e2dca9513b7bd76e"

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
