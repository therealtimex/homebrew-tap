cask "realtimex@1.1.424-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.424-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8d9fecbdbf84c2a1385edb695b04d54b9bbf5eb3863d3b7537e048cc7d7699af",
         intel: "d4ac74f01abe378df7d3cae2b3ae7b4edb19625a51338b2670f0576882d1f409"

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
