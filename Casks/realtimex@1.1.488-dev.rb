cask "realtimex@1.1.488-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.488-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e715a64649a36fbc5c9d3d8935e9dd4b8bf2114a53cc3b21fa99a0cd12951921",
         intel: "e0bc8871e08cdb0870ade6d7b20c0572ad4f4453cd2ffd93c1e7bde91084d5ce"

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
