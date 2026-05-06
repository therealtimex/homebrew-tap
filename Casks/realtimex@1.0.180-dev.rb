cask "realtimex@1.0.180-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.180-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bfb1a5c7a565d7cb27804edeffeab9228463a48aef11a0bd8ae3466a75ce20c2",
         intel: "4bfab38978272e8e1397e5172650a76750c662ea0d0951d01fe0e145e047fe1f"

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
