cask "realtimex@1.1.36-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.36-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "914321e52ebbf9f14d9c4f309e261bb511c9bf784383e914f2c4ac60c41569f9",
         intel: "4f773b16286a4faebb2c0f7e389f6a4d90c45d8366a4e2acd29f6221863892a3"

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
