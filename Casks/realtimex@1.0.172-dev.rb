cask "realtimex@1.0.172-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.172-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b109477fcc1b17c221147aeb9b73b8c086477a6d60ea5e8134675107bf6394c5",
         intel: "c0063e9e498bf4a722f19fa91a7225df9a4284ec788299d7beb1fc72047a2b1c"

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
