cask "realtimex@1.2.200-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.200-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d2738858890b841dd99bf15087da5303d021393e1d34a9d21764b7b2601a8151",
         intel: "2ca5c058f761a4143f0018e2854d8d438239f9e78d4eddc796e900719f8accd2"

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
