cask "realtimex@1.1.332-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.332-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6ca50a8ac4f7789c9870bf8d66ade4be8bffdc4558f14c5a923f8e881164c046",
         intel: "d0aa8d03eb820b5cb36e8a24f117b31741eef8637401b9842386f895b5f9edb5"

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
