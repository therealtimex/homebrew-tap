cask "realtimex@1.1.316-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.316-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "55c0358eaaca7acdacaf2c56ffd8962c7efa594c8b4c8264529dacb133ca9012",
         intel: "56d49dca23a845befca582a3476847a020a115d80ca7c45321a9957cec830f68"

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
