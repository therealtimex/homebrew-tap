cask "realtimex@1.1.40-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.40-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fce2e22b410fa3e7e6a2090a02f7cc3871186e1deedc260da2ebc4e0aea52ee8",
         intel: "f9ebad5f004a86fe5a150f014ccb599a3e9fdf0fecada3346521c6661a284ecc"

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
