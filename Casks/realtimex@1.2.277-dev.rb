cask "realtimex@1.2.277-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.277-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ac2986e49c9bf651da4c51c39dd27b50a48e48501e45e8f833d0ed58b1ce8afb",
         intel: "737f27cb56293596c9183fd2e8835e58764ff28b03a2e29a0c6b36fbee98801f"

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
