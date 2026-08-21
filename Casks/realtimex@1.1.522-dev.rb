cask "realtimex@1.1.522-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.522-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "458d83dca238bb64f1da2a2494e2c0690e2b952b5196210fddfa57a66b3a82c1",
         intel: "4f589c94375abd6b52b975c19d9d1cc7db268c4cca9b359ca378074fc60fcc95"

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
