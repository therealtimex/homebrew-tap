cask "realtimex@1.1.149-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.149-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8ec8892fc59463f4b9cd0d91a2b211ea31406545601ecf8d37c96b6cf9d119a3",
         intel: "c44105e55f58c5426bf471be9748ac3cdc8bc6d710bd364b60b030365345d9b2"

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
