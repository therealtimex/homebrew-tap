cask "realtimex@1.1.333-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.333-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4a636140da04ded4fddb94dc782ed85f58a62e4de73b95c7528de278adc32bc0",
         intel: "b761a85ddacef8061855a821a3fb3fd317ad5ec7dcfa0f1313b56d4b768907ea"

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
