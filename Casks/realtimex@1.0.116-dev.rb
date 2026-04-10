cask "realtimex@1.0.116-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.116-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b1ed81b8fc215565cc3195dc6a2a32fdf63e2fd769e4925b3b209fc16a8b5c1b",
         intel: "dbe757f4f38f9a0283ad795e70942edfe594fbae2c0feda268c7755a9a6191a2"

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
