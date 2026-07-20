cask "realtimex@1.1.321-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.321-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0f0a34f070e4358a540f0dc79cbb883815d81fa183e4ea83f2ef1ff48eded652",
         intel: "46b1f389f32e917d1f0b549da03015bfcd80f38d44900be05d0dbbade2a20b8c"

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
