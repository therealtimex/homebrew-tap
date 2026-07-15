cask "realtimex@1.1.252-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.252-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d5e9b87e3dc6555b1ec3bcdd1b3705fe017e9ff4d79ed7315e611f8babc355bc",
         intel: "dcb24da1ea2e7a2f82c9f4278ab40b8ac65bd4e4987b4ad7cd164f6dea51c3ef"

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
