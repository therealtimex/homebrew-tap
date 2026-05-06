cask "realtimex@1.0.184-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.184-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9554e797b5c77ea186637ed665ca16271cc2dca9848caf75fb3f36721b4fbe43",
         intel: "e2bcd4f96cc59ed83f47fe35536b7493cddc3dcb2fc628a550342b24a6705653"

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
