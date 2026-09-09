cask "realtimex@1.1.586-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.586-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ed50d86bd6b8dd423f6ed95b5e5ca2c889c4412f11a50a33a97b12f132c153cf",
         intel: "c15599f5ecd760ad801eb0691f49f98d44f5e719c63dc372c9872fcea8e89e49"

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
