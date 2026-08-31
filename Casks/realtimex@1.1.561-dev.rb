cask "realtimex@1.1.561-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.561-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "99c06ad303cc92d18b321002af3ea81d23f38bfbec64486f37d7d120252cdc87",
         intel: "adb6e5f0a58a45a212d44bb5363b3e43b8238c7f781ce210b5a298c626387815"

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
