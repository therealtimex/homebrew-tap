cask "realtimex@1.1.466-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.466-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4e7fc2a041f6819528850943b71d1c79a4dcbb929c7921c9f8d7e542aa6a0e60",
         intel: "a896afb79b56c1ec1668735a098e0d9b98ed9e792dab7c5d2700a69615e375dd"

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
