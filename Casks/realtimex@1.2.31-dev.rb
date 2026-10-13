cask "realtimex@1.2.31-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.31-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "64b29c37682e83c1643da97aff8d9704caae09917d0ac623cea7b9971e7cce26",
         intel: "2b2d1eddeb086263eb512a17bd1bb5393290ca7c353733440ff6efc807113d99"

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
