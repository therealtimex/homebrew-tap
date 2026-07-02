cask "realtimex@1.1.170-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.170-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "00937171631383bb6a30071981cee43387c91b065ec96da4452eeeff2dcc69fa",
         intel: "4ddc3795ad0df7f656d30a14e6bf441757ac4dfa65c243fac76b51f822e0b81d"

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
