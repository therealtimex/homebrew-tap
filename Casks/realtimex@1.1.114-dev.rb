cask "realtimex@1.1.114-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.114-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "879d5bb5668ff42574411c9b799c1e1889364fdd4d6cf471c569c038fa645c0e",
         intel: "90eb0fcac7d518e150c501f3db4024f75ae810247e5505b3be8e04bfb8b34eca"

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
