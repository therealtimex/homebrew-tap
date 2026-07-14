cask "realtimex@1.1.242-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.242-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5ff632b3d6351c0fe4a47869724940cb9c9cf100d35b6f0dc825056268a89a18",
         intel: "92ca3562995695c7f0c9ff2c0514cf40af49a17ecc3f187475cf49abb02b41de"

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
