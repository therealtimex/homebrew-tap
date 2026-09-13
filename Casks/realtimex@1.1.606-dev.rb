cask "realtimex@1.1.606-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.606-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "dfc72a53b7b810172839dcd4a95ea1c8b1bfd4b11700af03401797f81bf5ff2e",
         intel: "07dd48458460375b3efb9fa92788d78d2d28ffc6a7b753c535a85630b6e2ba98"

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
