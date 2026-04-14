cask "realtimex@1.0.137-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.137-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e8ce272030764fad4ca890ba20345572298dd0a3e55c63c29748e0b03cd3749a",
         intel: "226e1cbcef0be33e247dbe2a3532b96201c5745c5c9392980621ece44eebac55"

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
