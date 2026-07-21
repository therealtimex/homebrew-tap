cask "realtimex@1.1.325-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.325-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d30a6bcb318ddf99d975273302b5c3fd7ac8579fdced8eab4a84b1e59224b495",
         intel: "e25766aab91e54c4d2ea9d71a36561e3c2237f2c437be3149bfc4ee54ee20c62"

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
