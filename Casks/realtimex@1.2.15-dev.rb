cask "realtimex@1.2.15-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.15-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "09526caba484ff3765b028bb6f701d3cdcbce66f774337d90777f44788635feb",
         intel: "08a076e4741a8ab359adf8a5437d239a78ac106e7e25e639304169558e5bda57"

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
