cask "realtimex@1.0.141-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.141-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7a928aa6e8951dd08dc73a8dc9267815f61eb4773190c77de6d758a18e47a84c",
         intel: "613227fa29d6fbd2eb707041d2659fe6a5b540f15189cf139150974d5776e99c"

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
