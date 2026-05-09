cask "realtimex@1.0.196-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.196-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e2e8e90dec27a5aa737f6b2ae8845a245579882906dcad3f806cb2444b6c5e9a",
         intel: "73d2c1ae6d4d2888e9ba5c9824779d37338c33a7595dcfea108c0db3a6e45450"

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
