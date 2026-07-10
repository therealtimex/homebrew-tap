cask "realtimex@1.1.217-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.217-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b39f5803b73781c5a62cd14eccf638a38cfa685d2a03e9364bd5be26e130ca24",
         intel: "cc4afd31949998cf7be0acec8d9e2969d3cbc95d0e6c806b1485b88b38ac8cbd"

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
