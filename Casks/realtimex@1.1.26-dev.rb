cask "realtimex@1.1.26-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.26-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b0481f6923cc7e1e372ed5677feada8bce2fcaa34625f535a3a7c453221f0884",
         intel: "559b092bc6fb8ebb7aa79b035ae92ce24a9d72ad8f5e4ef91ed7152b544971d6"

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
