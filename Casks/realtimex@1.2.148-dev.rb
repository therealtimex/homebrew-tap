cask "realtimex@1.2.148-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.148-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a4512671791acbaf55e2e90ce5ca78d5d11f618d6cc783d32b6adf723c7a596a",
         intel: "a9ce5a25b1aa7321d29fa0c3082807d7cdce5346e664b23498e3d01bdf377c49"

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
