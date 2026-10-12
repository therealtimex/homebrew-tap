cask "realtimex@1.2.20-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.20-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2aa88cb3c234617f35d68e327080efcc5ce22c0bfae553f0ed2267a9bcabfa26",
         intel: "371a063a321f340f22668fdd45e08a5d15a7dcb33857a925c92030ad6f2b40d1"

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
