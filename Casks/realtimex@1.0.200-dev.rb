cask "realtimex@1.0.200-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.200-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ad338c82f7eb67075ecff4230fe9bda14ff97371d1cf2138b53d7ce5ba846807",
         intel: "75d2eb9c8a74238f8c612090b5667ebe3adc5456320732b8c31a9fced487977e"

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
