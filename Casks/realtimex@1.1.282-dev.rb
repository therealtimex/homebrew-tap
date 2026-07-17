cask "realtimex@1.1.282-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.282-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e46b5587f98619c6b336ce5daafed99bf09979d80e4334f4a8ef659259a37c8a",
         intel: "b40758e3294f06fdd6d01531b0f1b64c861d2551a9355dad8382e0bd7fd1dd91"

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
