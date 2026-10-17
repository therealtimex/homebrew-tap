cask "realtimex@1.2.50-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.50-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "52d3a3499025be064ebffe5e293f9885ce513b9bcd413aa2047c2d5e03d09928",
         intel: "0bfe8f79510604e69fb326031c5c9252f5cc6d0836fa00ce274fe0f7510fd3a6"

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
