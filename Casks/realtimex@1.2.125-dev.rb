cask "realtimex@1.2.125-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.125-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2cfbed93c98d6d580fcec90f176372e3a2a06dcd803cf283a123bde9a805b1c0",
         intel: "f977b7a7d033978e73b8920fe7677a8cf40e3ecb296d991627d97d722d661aea"

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
