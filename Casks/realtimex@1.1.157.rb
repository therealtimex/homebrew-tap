cask "realtimex@1.1.157" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.157"

  # Provide both SHA256 hashes
  sha256 arm:   "5d7b0c17d71ac2d4afd94683508dd8b6fc89ea483e5508f2ff7913534e4e69e8",
         intel: "d1d5bac0cf16d352f07a9a2ddff0d05c4ea99f49879b3a0225c9f42ffd040039"

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
