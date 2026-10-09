cask "realtimex@1.2.4-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.4-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "dc1f6a7df90c7d0a0dce6b7bf085891f485704471084f7d43df53ff28a3d2b33",
         intel: "7222d6917be0627802d87c9aa6edee9f0ea925ccb5864617997941aacf00b1fd"

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
