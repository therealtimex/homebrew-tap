cask "realtimex-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.167-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "60d64744ee8b42c1f2c9b7a7bf25450bc5357cd7de260e5cadcdb851b0c171af",
         intel: "71a848802d6e8b5bcf8ae6ef4e0ea0c13c476fe21f55e5f172765fb3fa626259"

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
