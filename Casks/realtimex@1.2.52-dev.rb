cask "realtimex@1.2.52-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.52-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5335e0dad0024c3c1e2faaaeea60b789bdd3dc51dda720ac74e3a6a5c1738652",
         intel: "9782766e80df535f2bbca8549bb618fdcac45725a5cd1769cc504343d7af2c6c"

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
