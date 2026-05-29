cask "realtimex@1.1.2-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.2-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a4867d252a8fece1e7b521284ea8ba4bbccdac8e73d67011809c5b5f98182cf7",
         intel: "eadf55005cbce9acee30e1df4c91e1de4db486f0d3c10abf88534dc3beb30149"

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
