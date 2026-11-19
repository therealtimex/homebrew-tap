cask "realtimex@1.2.262-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.262-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "894d0037710630af3a3cad6636ee3da2664492f181f0289456cf3beded0a10ed",
         intel: "d5d147c01486168df4ff051b7eb6714876d60ab7cc7c43638a9e53e87ea0a67b"

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
