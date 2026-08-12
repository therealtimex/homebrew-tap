cask "realtimex@1.1.490-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.490-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0efa86169f53682c841e2b92633441d6c1c83a4a0968a2b0e3f6de23b27866e0",
         intel: "9a6e4d703056026202fa130b6dab1a42809f8525a5fa7823435ef3324240c3aa"

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
