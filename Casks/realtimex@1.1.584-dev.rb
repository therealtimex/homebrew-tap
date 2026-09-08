cask "realtimex@1.1.584-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.584-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6aa7b9ed3ce510dc713213cfa65f56ceb2d2882a4e00ffc23a96339e2b50cf51",
         intel: "22942c1caeef954b01a0ad7b3cbfaa508b3a739859f340addc19c4258f170897"

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
