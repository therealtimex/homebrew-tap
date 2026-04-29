cask "realtimex@1.0.161-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.161-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "00f70ffca0bbebf84129bba65148759f880ced0916d9727ee5b26ba656aa81a0",
         intel: "dcb4bd06f642ada5a0dfd7f6f1618fa3211485d2bffd807d2d2737be99726879"

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
