cask "realtimex@1.1.126-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.126-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "583d72226094470accd22de4ce405589bb9cc26ef06a7cd7a79eeeade017c48e",
         intel: "d4b252137c700e2ba758b6c49e13e2f63206910dec74e0b41925ae97a4cb1a4a"

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
