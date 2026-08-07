cask "realtimex@1.1.460-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.460-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "28cb1323abb170912922e3bd81af42984a71f8ac7d060c853d4072f85acf9eab",
         intel: "d33ec5608565822e8de82b6efd2f60657f03315ddd6429abe6d2eaa25b7813f9"

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
