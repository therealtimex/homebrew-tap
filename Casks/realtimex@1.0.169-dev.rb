cask "realtimex@1.0.169-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.169-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "eeadff616e54eb7273c4520df510caebaa15bf39733fbc5d6b75046f132e3950",
         intel: "f6b62111940b966f8c674a9f041e67dbb041bea18ad0b1adc72456c211021bc4"

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
