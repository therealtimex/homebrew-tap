cask "realtimex@1.1.532-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.532-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7903f05f3dfd60ab0dececfe05934d90c0916a23cba2dfa34fa41e943a0c2fa1",
         intel: "905de0b3125378dd637393f1daa852983007387cb92f5a0dd56700c3a20790a6"

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
