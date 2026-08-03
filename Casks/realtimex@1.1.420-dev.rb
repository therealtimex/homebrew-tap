cask "realtimex@1.1.420-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.420-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "556faee9f1f712bd4a446b009a4d28d25bb6f8c83e08f5e60425953d996aa041",
         intel: "69659f12a37f8d65e21969422788af1fd8c85d91467a777264042cf098aafd00"

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
