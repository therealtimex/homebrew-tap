cask "realtimex@1.2.166-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.166-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "75514f50dae4aabd3419d73a8fdf2e3a98212d9ca481712a4ca97bf56452b2de",
         intel: "dcb885267c3c2ea071d8fae540b4d6f38e0f1d4c9c85bd4e9338c42ffc0d96e8"

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
