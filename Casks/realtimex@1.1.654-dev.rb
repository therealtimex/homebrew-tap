cask "realtimex@1.1.654-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.654-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e2c10c127bcaa7039379cea5a208e7e50bd721cd49898c006c839bca7a6edfb7",
         intel: "48426850e663bc0c4c915f21cbaee57010067e702af940606f63d1c3298804de"

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
