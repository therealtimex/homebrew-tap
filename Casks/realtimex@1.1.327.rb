cask "realtimex@1.1.327" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.327"

  # Provide both SHA256 hashes
  sha256 arm:   "3dfdd9d53b04da8dd35dc4292f24f7240ba99830792148bfea9c5fcd85956c19",
         intel: "993955bd3d608f0e1dc6d1b788b1a0cb03c3f888249bd0d6bf080056b63f7016"

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
