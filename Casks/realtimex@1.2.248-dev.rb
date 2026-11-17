cask "realtimex@1.2.248-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.248-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "09fec9976fddae23ac493216792170dcea9cb5705a611ed6b62befe355169fd8",
         intel: "572d51e386f241c3b19faf5875e00f7d077025c838de96cb0bbf1899a399b43e"

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
