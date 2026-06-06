cask "realtimex@1.1.50-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.50-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b33de1eb1b8dacda199510c04409dffbd9aca4593d76b039a3d8e2fad4c0b25c",
         intel: "710010ef3591ea83ce463e2c513ff3d3961bf66af2eb227c5684a66dc9e576d8"

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
