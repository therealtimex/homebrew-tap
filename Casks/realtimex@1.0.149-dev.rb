cask "realtimex@1.0.149-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.149-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f1e9a218e3e39b2535ad96a780b74cb9e17dd0db52f1f2a919c0462f70828743",
         intel: "cd0a4d473bc5ecfcb5fe42f1b065df15e50b44e8e6830a9d503685405e9a7ad5"

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
