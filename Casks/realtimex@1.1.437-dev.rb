cask "realtimex@1.1.437-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.437-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "72430ea2e7e460383cbcdd95f22d0cccd5f52e217626f2a180c636964f8efafd",
         intel: "86e0db4432c57a96e7f60ef848e537b7f95d06afbc57e2e211eab5e143c7803f"

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
