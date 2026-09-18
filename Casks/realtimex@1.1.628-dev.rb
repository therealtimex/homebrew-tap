cask "realtimex@1.1.628-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.628-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "143a5ec297183fd36f8d7d02dbf0e0b8cbbf0d61b98ce8c2b5ca5d4c08e2965e",
         intel: "141c40bd104471659dbfc10a1724e39b4f96ee4d64871d7dccb3b48beef0af42"

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
