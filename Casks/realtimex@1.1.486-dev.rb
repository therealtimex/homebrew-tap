cask "realtimex@1.1.486-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.486-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e86fa1bdb4ab55a0befa81fb5712b7e512555f5dc12912cb5352096192e806fb",
         intel: "5d6019c6947126c9e90eced03be12c92abc502046e7fac4d2d55b1b9ad399ba4"

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
