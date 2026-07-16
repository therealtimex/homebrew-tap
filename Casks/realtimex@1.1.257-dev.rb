cask "realtimex@1.1.257-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.257-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2cc7d362c7e91e9d4c71984032e5f5dadc74e9733f82f107e6a0d7d4ee6e2bce",
         intel: "1e846ea2fa36874b3be7b52dea6be26ff2630d1103dff10d1c204a2ab4e1cf1f"

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
