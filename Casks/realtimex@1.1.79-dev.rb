cask "realtimex@1.1.79-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.79-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "261ddc5e60b99e780e671f7e6d39f449eb4753428aafc13a22001a8a9a370b3d",
         intel: "62c220283873c3d3809bc3b3666d78b098182905fcab8dd9732c8d08d970069e"

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
