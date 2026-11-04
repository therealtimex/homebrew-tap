cask "realtimex@1.2.196-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.196-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0e2370b0a5c60bafa61b42d475dfe9be05885214cb93c569b115c528a705c87b",
         intel: "e6fd4d3143b37d7e346b2e51c14cdc794fcc91491aa004218851682a04f9684a"

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
