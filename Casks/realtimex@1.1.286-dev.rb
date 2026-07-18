cask "realtimex@1.1.286-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.286-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "95d9f892693a626bef19efa3e429107bf68b627801781ebc5639511da7e12c69",
         intel: "0710347ccf1aade8a34a40bc725475b4094b23a7f41193791d91cc7de9894f8a"

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
