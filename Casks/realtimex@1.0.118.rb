cask "realtimex@1.0.118" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.118"

  # Provide both SHA256 hashes
  sha256 arm:   "4e541ef1fb91b467c899f26d3fa5e04ef3c567e1adcc5feae89be5f5e0d0f555",
         intel: "85cd23b7427ccbd593f2ed3ec9b0025fa70da9fae78f5f709322f4100c33c7ad"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit']
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
