cask "realtimex@1.0.195-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.195-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "472647ee3f9b2a8a0debc51f55951a7e9aa723802d1f573e587f5b64e40a5e72",
         intel: "d7975869a65fed69f2287b6a379260a2d0a6a48485a2555b6c4fca90aec70f8d"

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
