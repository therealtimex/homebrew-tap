cask "realtimex@1.1.350-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.350-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "343cd82c78564501322a6b2eb90a9ae7f7e480b42b13ed4c1a66f7f9939e818b",
         intel: "e6fadb65831545347c63987b72915164ffc6d10703b3810d293b7e43f77e83ce"

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
