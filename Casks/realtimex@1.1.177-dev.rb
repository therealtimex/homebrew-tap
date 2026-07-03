cask "realtimex@1.1.177-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.177-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "70ef6df3381fde6593160b9b7863a44c9800b0f65ff1e30bb80cc2925c5e343b",
         intel: "4343fdf78dc4268f96d80608ad1bb29e824ef2aeaf189aed27409c5591594702"

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
