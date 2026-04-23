cask "realtimex@1.0.152-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.152-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "97866290d38fa6443ef473553958c4b1ee4bcfbcedc06305678a2d07aad581c9",
         intel: "1c21b5a6bbdff2b58c25f0004c832310321e45c43ec121d54129557bd5317864"

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
