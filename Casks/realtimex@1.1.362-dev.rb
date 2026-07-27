cask "realtimex@1.1.362-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.362-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1cb6905c04ba2921a3f806f8c7451737e008b7b01fb1e8d1f23ae50a2b6278db",
         intel: "e881f1ccc3e103c3447eeb7bcd308736a99bf35c80ede91472ddd228870ae6ba"

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
