cask "realtimex@1.1.76-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.76-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ca53811a2a987b8089ea76a1f623d038f64ca38f473e8f838258ba9aec9e0b5a",
         intel: "c1eb70e9dd944fcbcef76f100369e82e81b56ab947f45e45c9839c49e8a28b12"

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
