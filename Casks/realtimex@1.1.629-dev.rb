cask "realtimex@1.1.629-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.629-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "861371e5154ce14ce0636ad4caff4b55950730f6d1b6990b7df80f9f17b22a20",
         intel: "51cf2c15056a1f075abc82253b55165bcce71e411482afe6bcd1b473b548a5d3"

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
