cask "realtimex@1.1.338-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.338-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c2f6d6742c783466b464e3702b97898c985d5f780a2c5e06f583b4148d807185",
         intel: "2a62cc8e729ba9cc7c0b22c328643a156a50fbffa8901365264876cb3cdeb866"

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
