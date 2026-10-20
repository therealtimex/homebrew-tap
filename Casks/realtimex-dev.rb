cask "realtimex-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.74-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "303c1c0227f9b316031aaa3520136032b9a4af2fddd24035f8f38ccb89f4ecca",
         intel: "8209d45f137ba75a34ac0b1b99990b034f4b94996edef445b5f2d5969d62b2d3"

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
