cask "realtimex@1.1.95-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.95-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6988cfc61a71e5520ad5f458f8054c290ee008c8b4d6cf56da996ebef20f8ac7",
         intel: "b7ff48c1bdec1803ad1431266a0b043d5630920f023aa9d0c8ed10eff467ae30"

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
