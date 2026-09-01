cask "realtimex@1.1.568-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.568-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c03d8a2f7fb63d8edc86035c51d59b6009df670fb9077aec1509151a1b676fc0",
         intel: "a788227edf4cc5faada262fac266a23aa206e58bc675f8756dc9ef6627eb759b"

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
