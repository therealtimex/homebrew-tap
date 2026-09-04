cask "realtimex@1.1.576-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.576-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "76f16ad96959cbbff48109ab9a039ced0722deb8821b3be04259f1740087ad1c",
         intel: "e06fc3f992e70d8c0659736162f74b86455f300472801ed993a75ece4b17b671"

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
