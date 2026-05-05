cask "realtimex@1.0.176-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.176-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2e3c03274fb476a9d165fc1b25c5630ccd40b7161a85cbd2be541e00c3886bbe",
         intel: "8b78121a8d88660fec055c603e6694ee28e32480c8d7300fb655830aab300327"

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
