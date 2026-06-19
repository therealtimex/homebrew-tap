cask "realtimex@1.1.112-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.112-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "da02062e044def2e9757513e3d15f3590debbeb46fe1aebd90f244f5221865b4",
         intel: "6bdc67355bad62e3751b1122bc643938dc4e7ddd1d94dbb99b1f0538bb695ef9"

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
