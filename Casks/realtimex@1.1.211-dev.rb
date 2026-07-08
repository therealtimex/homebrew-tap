cask "realtimex@1.1.211-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.211-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "12091ccdbbb67ed778e8f0b3f42c7d9e26702d0b97b354d5319716b39344341c",
         intel: "5f7ae3e5028a4ecd6240736540bfedc9b984b0cb94254a59bde09079b0704434"

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
