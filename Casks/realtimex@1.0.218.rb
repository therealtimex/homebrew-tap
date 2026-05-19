cask "realtimex@1.0.218" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.218"

  # Provide both SHA256 hashes
  sha256 arm:   "4dcd22442901746c47171a9b9e6f2fa29c55e18cf44ad093ca731a240c6f3f7b",
         intel: "5d05d05a8ae5f686740a335223beb58fe003ed64eef056d515901ce5d10f1d31"

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
