cask "realtimex@1.1.693" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.693"

  # Provide both SHA256 hashes
  sha256 arm:   "ea6b866d0e0e6a1cc5440b93fadc6faf9cb63447005b77f483a94973dc7e63a8",
         intel: "cf9339005cc85ba00070ffbe28cb652815de168f0d11bfb2c5cb0a625e52c0fc"

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
