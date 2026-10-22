cask "realtimex@1.2.94-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.94-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9ef357a0363bb79591b19d1a52786741afe3fcafa210cf1bb5a8d0ad20564b89",
         intel: "c9b10396f842cc61915399c01492988fb6efebe2221aabdf7c718d9f1cc9e30d"

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
