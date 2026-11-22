cask "realtimex@1.2.274-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.274-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "34e413275212f80f17db2cce138582dcc7791546439bbbffeadd3cc247c03209",
         intel: "3fd70f8e0a70b68c9addb79831a87dbb73e02ee3a28dd17d47bcbd7e0e654ef7"

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
