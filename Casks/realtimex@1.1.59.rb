cask "realtimex@1.1.59" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.59"

  # Provide both SHA256 hashes
  sha256 arm:   "c88bbb452c9e35d3cb0044c846326c86f6d75c5433b20d0d136bc2ab0b5719fd",
         intel: "3a30b9b92da9a282723dbceef86ffe2e64c92c00f0722e5c555828f9093d3e83"

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
