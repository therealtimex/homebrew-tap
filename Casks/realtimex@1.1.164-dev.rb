cask "realtimex@1.1.164-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.164-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "656f4c632aade01203ccbb45f82b717d0d12b1718c5ce4e062d312fb321c821b",
         intel: "19b8f1c702bac2b8051b7859bdbecd39270764c53c3dfa538163c53527390388"

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
