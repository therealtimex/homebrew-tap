cask "realtimex@1.1.179-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.179-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "363397217b8558596fb0ee17e8e1297689b1869009f4408c029f8766d7203efd",
         intel: "af193219ea7f4f39aa447b10edd3f1724a3e2abb71a898fa1cb5a3074bd9b326"

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
