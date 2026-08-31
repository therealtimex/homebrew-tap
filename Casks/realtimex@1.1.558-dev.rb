cask "realtimex@1.1.558-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.558-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "49d7f9dfaab9ca08bdbb6b66f57bc2ce83e445cf52971b11c127c1c4e233d92b",
         intel: "81503c64b056dd1e2672b2d0f1e2c4484eed99013daf8602fac20ffa1d689bb9"

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
