cask "realtimex@1.1.62-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.62-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "72d8c5979df98c3efc675a1edea3ca0efe966a11ba6a3399f1ed72dffd7b7ff5",
         intel: "901b9aba98a555269d7c33e977114b50f735a33309e41fd3872682655a2c9314"

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
