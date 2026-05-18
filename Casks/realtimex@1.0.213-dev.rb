cask "realtimex@1.0.213-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.213-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "642f803d9a3543f70d2855dd769660e0fa3063308663003edef9f67b11976da6",
         intel: "2dc4b98222359f200cc5c0979137d69580d5ff39825fd4bb5559703cb917c106"

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
