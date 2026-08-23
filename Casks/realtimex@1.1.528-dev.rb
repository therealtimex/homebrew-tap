cask "realtimex@1.1.528-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.528-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "46fa1200f2d5dabff5abe869bc4cb63801c88703af10a697ad7c406bc45086f9",
         intel: "8271367b306252de981f21e048bb6818cfc40e8412c271a00331fccafd2cdafd"

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
