cask "realtimex@1.1.396-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.396-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9a96846ed4757cfb07b84593d9b5075aef35ad5df9a19c74a43d8c96b7e751f2",
         intel: "e68fa78b4922f8f86f620224e56b54f3f95b9076b59a9c47f6ee0d53facf286c"

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
