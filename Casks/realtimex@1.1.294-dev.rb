cask "realtimex@1.1.294-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.294-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "713fde4344cccc4d8c2f827f5312fd229963fe723312f83148b429ae8457efdf",
         intel: "28dd8e42356f0f03ef955774716b100a0c9a5ab450d3364f2ef08da2298c40b2"

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
