cask "realtimex@1.1.401-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.401-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a73e922daa0f1206cad95d4d02dacc5e9e10cd9fae396409c35bf2a750adb13d",
         intel: "423710ed67f71d31cdc9b8dd86396f14738387e9493b1752cd44ce2013b1691f"

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
