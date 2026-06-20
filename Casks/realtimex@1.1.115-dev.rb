cask "realtimex@1.1.115-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.115-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d201c31c9d51ef823a1d12e07937b9e3b8ad42d2f5d947a9f3d1f849463481d2",
         intel: "7addabf7ac5084462e838ce52b7117686f6656ec8bf2c5245ff8ba8038c8ad7c"

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
