cask "realtimex@1.1.45-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.45-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1523cbfe7742585ccf7afe9515529719db4d80e23e816b6fd7e1f3421f23ad5e",
         intel: "beee01fdcd87bd39709d5086b262d0e2e6a75541feb5a8932ee53122fe22759b"

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
