cask "realtimex@1.2.237-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.237-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "aa148c29adbb397834befccbdb5a005cf2dac0eda5ffe601f737c244942bfb29",
         intel: "5debe090fe26aa07a2f412794b319d5689d5d213a70b65e8e1f751f8e9e5f9ee"

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
