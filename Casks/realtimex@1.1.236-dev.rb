cask "realtimex@1.1.236-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.236-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f0c5878df515b0474efc41b1619c8e9a1ed69af30797e2cace3b884a5b5f9cb2",
         intel: "3281d8dd4f813edd1c948e95f2c6fb74e7c82654a4126cb07c8f56274c5f86f0"

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
