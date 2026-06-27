cask "realtimex@1.1.151-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.151-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d43687ebe2199bf612bd68805af105aa78928f56d47b0ff1e33c395f349947d6",
         intel: "4540a08b874b3d7015312e1a62c8af48b28f5ca7ebec122f3f569fd9fb3d2096"

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
