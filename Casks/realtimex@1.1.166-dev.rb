cask "realtimex@1.1.166-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.166-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fc35dcef29fd055b8b41ee2a7f870f56011b0ad10519430962e76186110ec554",
         intel: "440918ca82285e2cd4f01e66bf7c949c93ab62515f511d23c7301093fe458c3f"

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
