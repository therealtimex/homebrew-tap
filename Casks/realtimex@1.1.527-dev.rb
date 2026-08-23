cask "realtimex@1.1.527-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.527-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9c4b155ac51872c5c841b2596af7004ab3698e5203cdfd5dfdac12581ed5c881",
         intel: "d3f4b7d032ec2b6e16131f183e21e8c08cb67fb6a2b7620358b0d9de8da7f713"

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
