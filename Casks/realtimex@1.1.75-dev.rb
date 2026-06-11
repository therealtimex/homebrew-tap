cask "realtimex@1.1.75-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.75-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5ed6ca9abae7b25282682af7e2f014764826fce1ab7d713a5d14ac0305714dfe",
         intel: "7953330866212b2830ddb19a785b04f607099ca67fd70b7d77fb5f242ac6d446"

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
