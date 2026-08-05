cask "realtimex@1.1.436-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.436-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7d7359542ae56808ec385e9b8a43d3c0dd8cf156a11fbda3393374ff6c2bccf0",
         intel: "750144904834cc50a62533b19efddad72a26a628b2e23c371b9178ddc83e36a0"

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
