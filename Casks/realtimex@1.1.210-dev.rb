cask "realtimex@1.1.210-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.210-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2f3a8c93ad7515fbd94c426d9dc0a2e810d0e65ae825a218131c43247f99e510",
         intel: "d8edc37f54714286482eef31ec8c88ff4d5df9046d584532c8fd427923d01db8"

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
