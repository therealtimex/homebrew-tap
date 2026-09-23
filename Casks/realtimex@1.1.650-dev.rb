cask "realtimex@1.1.650-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.650-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "edc4a6dfb1f082407d8c11e52108ecf520b657a3a80bc6da1c6630401e2fb5db",
         intel: "51d93ddbc6235204aa255bdf1fcffe41a947f260290654aa3d42317ab1061fbc"

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
