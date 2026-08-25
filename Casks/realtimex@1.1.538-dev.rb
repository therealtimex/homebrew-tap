cask "realtimex@1.1.538-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.538-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "928e2cb61403d22c28a4b13cf07c61c4512b7031991bff437cb8b8d182498fe0",
         intel: "0b8ddb8962b14cb1b4614a7aaa3d9a6106f5f43f73d5fcdb055ab71042b50100"

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
