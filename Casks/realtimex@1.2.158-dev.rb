cask "realtimex@1.2.158-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.158-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3ccdd3be98cba4b76368e7044e4fdc9841c2874c7f7227f28eed1fbb27cc9e22",
         intel: "3cefa4fc5299041cd0c5427dfac52d6f61a09bab4f868c1c918129a12c0969a4"

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
