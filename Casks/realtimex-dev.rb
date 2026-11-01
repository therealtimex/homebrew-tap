cask "realtimex-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.162-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "53070a7114c8bf8bb5faea481fdb53f5d2cf2ea1127331daf9f3295631af2fcc",
         intel: "7b8c65c86620dc9c1b606c0414b05c71bf96ea8d78dc9104ddcc40f14e88a8d1"

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
