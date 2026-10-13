cask "realtimex@1.2.27-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.27-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "38f8f2635b91e5f84c42fca9832aad7b9836f155307ba8b5633352b9de18ff44",
         intel: "e2ebaa62faf9812fbabeeffe7bba818ec022ddc60da819eb4352382d0d8a0544"

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
