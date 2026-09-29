cask "realtimex@1.1.676-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.676-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7f69a72297a220f1a79bed72c2d623c4eb18aceb89137aaf7667f7f228e60011",
         intel: "8fbcfbc12e8f4aa3e0cdcbf3b5e6113e74c7e2b7f5c2952077a72396d145153e"

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
