cask "realtimex@1.1.518-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.518-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "192bbdfb48b7d63d0de4963a8a90e5bd178b4e8cb46a85497833f0e5d89f1d9d",
         intel: "22979ac0f4903fc5ba1f23464fcebb0cda7c59404e9bc129c65f178b0d3b7dab"

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
