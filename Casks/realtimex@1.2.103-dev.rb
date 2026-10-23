cask "realtimex@1.2.103-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.103-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0194b9f4d9bc548203c35e4e2201c30174f187b783dd06ead109e95bfe3192c9",
         intel: "47dfc31cf1df508eaeff621f2dacc5183b8fa1305a1faea5b102335da0495858"

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
