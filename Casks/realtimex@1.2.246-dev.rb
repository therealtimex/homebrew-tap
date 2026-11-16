cask "realtimex@1.2.246-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.246-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4fb3df45e3636b84c92bca017755637004af0cf90c2c1677ae241ad9a836a2e1",
         intel: "4ae69d0d3a049dcbea8fc0e154ce42a1ebc9b1b249392ca7b720056af723891a"

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
