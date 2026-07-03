cask "realtimex@1.1.178-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.178-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2f61244b44165294b90c51b508991d5c1d7bea113e78bf4458632691010ab8d4",
         intel: "b1a9b48a5a2a58b801879e0b63aa8b337fc526170e7cac30444ca47072b4d880"

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
