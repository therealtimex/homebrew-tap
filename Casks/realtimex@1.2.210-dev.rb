cask "realtimex@1.2.210-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.210-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "974c16ef33b1b5e2c321f83922a9ed166c2ebac952671426a38a55687eae2822",
         intel: "544c88d92f7578cac739db823f7b955ba2c32d524fd160c934b80867937aa97b"

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
