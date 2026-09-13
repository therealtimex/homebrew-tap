cask "realtimex@1.1.609-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.609-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7abce8dd122d34a94babc05fd822d204956237cd4f5c39a0452a5a702ab88ada",
         intel: "c31a2658668e13e0bf525b0745e6d38aa3efb154babdcacb8edff1a490f0ac2b"

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
