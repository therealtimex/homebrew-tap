cask "realtimex@1.1.99-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.99-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "51dcb430f83c0e1981ebb3896c47b6126a5eb7488a5364fa349d83d3fcda095a",
         intel: "f06efa1fdbea7bea9caa65029cc51fc0ae10d27c499ce8caf83645506ac121e1"

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
