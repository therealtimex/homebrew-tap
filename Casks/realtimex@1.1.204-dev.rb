cask "realtimex@1.1.204-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.204-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f5638425ea19b5ebf9d2ac35c8d6349815aef194cfe2ea0e0561bdb1a8bb0af5",
         intel: "884a2b605f320ccae0917989a662743f4f1b182e692b7d6e0c378be080ab236e"

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
