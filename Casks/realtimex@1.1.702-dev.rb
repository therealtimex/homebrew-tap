cask "realtimex@1.1.702-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.702-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f7935a20fc9e7a09fbe01fb479d1bdd6ab9e9f92bb3a45aa6fde86b47f7f5268",
         intel: "8cf90f2d2ebca2bb2d5cf40a97160dcb9d3a3e74ef109e8ca7d9842d82028f86"

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
