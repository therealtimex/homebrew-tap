cask "realtimex@1.1.672-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.672-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cd6ebd15a091e5848ee33092fdbe4aadf5431c32b17df027629a9c10e1c09656",
         intel: "c48b2cfcffb9e29359e392df249f3af480d9fb84cacd9ffc359e658595cc818c"

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
