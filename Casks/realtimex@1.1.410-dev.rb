cask "realtimex@1.1.410-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.410-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "de6f8284c667d608d3efa179e14a1e114964dd6391277ed94520ccbe54bb236e",
         intel: "338e52ba8fdcce48e305d131184cf7e47b5bfdc95b2ff2d3e3109e75e07eae06"

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
