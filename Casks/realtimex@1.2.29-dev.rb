cask "realtimex@1.2.29-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.29-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7045ffc5657d1c2681a65340fec4269edf814ed281a770eee401b4a1fbb55437",
         intel: "4bbda4da43d0b994d2ca75e4247074db1e101860d97afb845c1c3b029d507dd2"

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
