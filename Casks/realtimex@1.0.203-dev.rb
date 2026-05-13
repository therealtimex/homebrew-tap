cask "realtimex@1.0.203-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.203-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "888cbe910c82f96e21303e8653d2d23a5547f0709e610542a27d9a5bbe79b809",
         intel: "f7ef6873f6cecb913bd563a53f316ece1b22e3777604d9b0571ff56feb88c80f"

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
