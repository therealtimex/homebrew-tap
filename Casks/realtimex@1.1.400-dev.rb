cask "realtimex@1.1.400-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.400-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cea5159b43a35bd09882352ca37176f9962a7f88099d412897e744578dc86437",
         intel: "25fda5bb36c8ee13c82c952135e0b0a5a6f91c39139370adba4ddcb177bdf312"

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
