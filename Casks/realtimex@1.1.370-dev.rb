cask "realtimex@1.1.370-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.370-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "10945bdcfc9bf7b3afc8e9722f4979c6f02c8e78a983840934aed6b2d45ab90f",
         intel: "d942a22b6ac9398f12daf5cdd2e0d006e8886c0fd6637490ec74b1146b4e26d9"

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
