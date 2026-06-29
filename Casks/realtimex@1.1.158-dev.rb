cask "realtimex@1.1.158-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.158-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "060b0b9fcb333addb7450bb4aff4c061502a1907c2ab7c96bd9c3c98c189c02c",
         intel: "04baa0b473ce548c84ec7270b8afe2f974f22780bdaf4bef6ee6a2064cf2ee73"

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
