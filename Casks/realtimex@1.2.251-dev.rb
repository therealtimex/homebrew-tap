cask "realtimex@1.2.251-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.251-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c42c5206ab57dc5228d45b8caee866b9167e9f259d0e5b170d98037b8e3d70e1",
         intel: "52cf5f8abeecbb274d5e28f1e33f7e4492e6cc836205b1f74fd4e1ff67805ca2"

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
