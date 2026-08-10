cask "realtimex@1.1.473-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.473-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6a8c2347ae955b53db91948aca830d1fbb3759991f702b2d145e292a5b4203a5",
         intel: "d067661a261a1524fa088928a413f9b0b63d11600bb3bf9abde953e4122ec68e"

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
