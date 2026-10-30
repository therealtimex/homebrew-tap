cask "realtimex@1.2.159-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.159-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4b73504c77ad4d27b733602f82bd3e9e14b6dfdbf3040cd99801028342a59412",
         intel: "688a3d6b615bc1b3afd1a9eb54ba7a3724ea756628964cdcd8851b3865c410ff"

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
