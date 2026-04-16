cask "realtimex@1.0.142-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.142-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5d281f31d95e8a3744f10943ef262fed58c847e0e0115cdbade7280ae6efa9e2",
         intel: "932996ce11038694c323b8b296323beb2c7b4b7b8fb7f0df3b989ad7d3f9b7b1"

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
