cask "realtimex@1.1.489-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.489-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2a789bc2eebf1756b2c648c98cfaf76743707fc152eefb269b880b3c59f95493",
         intel: "a4f166919ef080cd461f896424f2194afd2a10ebb117bdd3c6df999032532b5d"

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
