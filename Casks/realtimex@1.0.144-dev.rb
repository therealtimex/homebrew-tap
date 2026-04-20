cask "realtimex@1.0.144-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.144-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "06c987991023ede4b058526aaa3d340608baae530eb6d5aa8a4b5d46352da01b",
         intel: "8a137554295a0552cc082682c2a9a070139dab4506bf5db8af1efe2b98e60bf7"

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
