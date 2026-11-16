cask "realtimex@1.2.245-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.245-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b25eba10f883d35886f1dc539a7dbf75ccce4a6bdc888f2db397d3ed6077217b",
         intel: "44eea79a184c87c49ea4762f04d0306b26884b175b42c4621a3dd32016942de5"

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
