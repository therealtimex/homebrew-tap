cask "realtimex@1.0.122-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.122-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ea53df2ec509e1f1bce8967a85186809fed315096aa87221bbf4a67a7b1a4dd4",
         intel: "4d294f0c66feef4edbc1a8269ba42b11e32afa5b8b090b55b1af8a29d6a59df6"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
