cask "realtimex@1.1.163-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.163-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2e914794a3475e156261314fbf775abdbec4ed99ea0176001b4ce77a00442be9",
         intel: "5e7f8f3a5bc89d95eafb691914643996e0cec81680693bc5e70fa296b481a130"

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
