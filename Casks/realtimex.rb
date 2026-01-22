cask "realtimex" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.60"
  
  # Provide both SHA256 hashes
  sha256 arm:   "30a7e382ab579fea12feaf7cd405f3d32bcb08a707de575a33b63570cfa69055",
         intel: "93e789c53ba141f5f62dab905ac27f9605fca6be7f00062f45009bf103925378"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"
  
  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.app"

  # Optional: What to tell the user after installation
  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end