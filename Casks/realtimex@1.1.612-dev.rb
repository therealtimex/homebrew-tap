cask "realtimex@1.1.612-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.612-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6c1de61ae5e988ecd801c6559d8534e62f3b467068bf0d74341c919106e9e53f",
         intel: "f9b1837f1a0848a399bca99ed143ff72b981de13c44abeb36834b7bb7a7d86ce"

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
