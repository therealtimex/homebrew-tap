cask "realtimex@1.1.28-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.28-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "50bceeb928c534c40a56f9bb1bede6d89dfa05113440b80a64599b9c6d3f0566",
         intel: "27500553e7074e8ed09514ca54c0665614c7451ae1f75999667fd91fa2561d64"

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
