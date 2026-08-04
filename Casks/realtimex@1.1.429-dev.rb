cask "realtimex@1.1.429-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.429-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5cc60f4972ffba4c8c56404458efdfc5b889ac585587edc71790b5a63df34d22",
         intel: "3559145fa15ac81bb33068ebc606f676d94565a5f7255184d7737b141fcb635f"

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
