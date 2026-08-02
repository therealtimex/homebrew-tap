cask "realtimex@1.1.416-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.416-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c0d345dc339a59ee42b1a52b1c3b28f6bc035d0fda5f969faf00cb257f5208ec",
         intel: "d98f34863503c9a0b1b77fd793af1edaa42a9c79447aa47cbdd382edad2b496f"

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
