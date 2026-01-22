cask "realtimex@1.0.59-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.59-dev"
  
  # Provide both SHA256 hashes
  sha256 arm:   "9c7efc95d2aee25d9830ffe36b53c6ee7a1f5e9881ac0238ade3f373eb2585ed",
         intel: "d490fd140318ffd1be51301a87720366f2eaf78e515f150e859f20b1ae1c5eb5"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"
  
  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  # Optional: What to tell the user after installation
  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end