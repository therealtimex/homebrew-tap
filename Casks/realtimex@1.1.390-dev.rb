cask "realtimex@1.1.390-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.390-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "48d279b8a2715b5541ada7fae92fdced66023ad686554e0972c4aeacfa4a022f",
         intel: "24c344dd9684a4f8f5883a8a9e414233cf1971c92b6788466cb95292976b8ab8"

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
