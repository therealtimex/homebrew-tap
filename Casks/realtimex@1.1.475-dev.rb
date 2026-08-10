cask "realtimex@1.1.475-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.475-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2fc19f73e7e8a9fb0ddc654794fb9fdae77eee03f0f497e71867952c07c0e4ff",
         intel: "6cbbb1c044f415ef07abb099698c9534193a7b7816a9961d15c02dd2ffa6981f"

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
