cask "realtimex@1.2.233-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.233-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a144e984f46778bc534231b5b6ee98214cdee9cfaeea55c99b6398e6cea5e802",
         intel: "45cc9f8e9a4d82d0041fdafeff99c53c69cdc05ed204c6f89eefe052f6fb95c9"

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
