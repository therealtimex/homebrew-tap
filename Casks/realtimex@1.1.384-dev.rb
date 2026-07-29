cask "realtimex@1.1.384-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.384-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3c5c92d44818ea3a55426ed650dfd33b441018fbadcfdc6f6af1b2a8f48decfc",
         intel: "8a4b026220517d2fe8d8c9758986946986986a0da87b45423a9c6e467d4c0296"

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
