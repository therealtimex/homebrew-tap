cask "realtimex@1.1.534-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.534-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e1cb6d2c04085f56f307064e57d4d031025632ebbea4e16d0c9e4cd761773f31",
         intel: "84e0d3352f83e599e0082a4a6fff19ff9b428764efb1e62c524c7ffce4ef77b7"

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
