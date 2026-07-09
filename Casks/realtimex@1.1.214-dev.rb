cask "realtimex@1.1.214-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.214-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "31022af63971a8216450866c2815cb0d29c929184d7d424de9e3fa0bba1cdffc",
         intel: "3ed04fdcbc253d69fb4fad8a14edfdaf78a2eb1311e146c7212c0a38f74703c6"

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
