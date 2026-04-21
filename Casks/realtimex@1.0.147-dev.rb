cask "realtimex@1.0.147-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.147-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2f469f72f6ee8d3bbf6aef0a1e7da49d5112290ec92003f98ebbb5c9e7b30e7f",
         intel: "a824ba175040047e456eac360fea1d4a2017bb3b1ff4e4da7d67a1c16426052a"

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
