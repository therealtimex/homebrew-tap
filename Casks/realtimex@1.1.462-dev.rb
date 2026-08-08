cask "realtimex@1.1.462-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.462-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "99577bed67655db27b6e34c82e2ac97998b09cb2f24340eebfe40516ca0f0a42",
         intel: "ff445377401a3fdb9c0ad74ecb861545642a3c423d10a592839282e1a2ff7a2d"

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
