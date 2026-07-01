cask "realtimex@1.1.165-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.165-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3ad3ca2389f22badc4edfc558786b229bf5f931f800fc5f70ffa602308467d24",
         intel: "4d665521b5815635c467acd1bba57399bcb7ab7f3fb19a6c21dc73fddc57bfdb"

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
