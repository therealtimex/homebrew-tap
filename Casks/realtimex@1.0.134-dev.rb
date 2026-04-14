cask "realtimex@1.0.134-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.134-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4d64d95517dd928f5f24199fc2ca229280c0b6b864d42b37bc1c52c9d7bd5113",
         intel: "4d0152fbbb2a315050ae55684669550c2d7122a0a5fd80e43692faa6d7a9c00f"

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
