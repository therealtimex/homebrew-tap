cask "realtimex@1.1.560-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.560-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bf7fca7d918f7a449ffdf26300071c4025458a27e618743395a1ece51ed51eae",
         intel: "2c0c8e373fd6e9e0344c6afc22f958742b75631349d8234e9ed1fe884d0842af"

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
