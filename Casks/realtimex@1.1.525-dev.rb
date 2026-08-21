cask "realtimex@1.1.525-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.525-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "90368d1e91a8e6bf26d63e7b92da26286d0da83c289f3ddf4f759917ede58894",
         intel: "fd8cb12c6f9314a8a8535a54387bc5bf1334071cabae6f6984ded08dcc992da2"

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
