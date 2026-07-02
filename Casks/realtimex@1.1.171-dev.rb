cask "realtimex@1.1.171-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.171-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3d6cefccbcc19b45262d0adb4f1bbc534fa13a1a952ff5dfea82cba9f405ee36",
         intel: "d722c7f627bed214311d110bcbe916c8fe2bc837d722afb8e653a362ae8ac627"

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
