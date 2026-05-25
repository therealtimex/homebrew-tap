cask "realtimex@1.0.235-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.235-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fdcd157096a92f838bd0cab0abc41b2015bbadcbd94d46dea6efce5200ae1ac0",
         intel: "66bff9787dc6abb5e369a3acf5d2078cac68fcbd69d8c86eb80789b41f72115a"

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
