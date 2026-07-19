cask "realtimex@1.1.306-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.306-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3a0bbbf78256c6ef0948c8fbba2a229a73902692e129b57aa03bbf2af94c2acd",
         intel: "2c4f29189f76c29b046af4bdd5e2e89c842eb54fba6a0dfe3f3985ffa991059b"

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
