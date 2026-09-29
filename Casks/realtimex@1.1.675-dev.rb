cask "realtimex@1.1.675-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.675-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "968d68b35d4752e07accc8a22543e73ec6ec14e3008ba96bf9d8d3d4a88d05b0",
         intel: "f52eab605b8602d1f02f6f5505c0b0287d481ba3d7512c889a973b3cc246140b"

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
