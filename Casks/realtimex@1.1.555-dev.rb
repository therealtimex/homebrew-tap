cask "realtimex@1.1.555-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.555-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "19858a3d930183b24311fa0634b2005f73c9a479d3c2bb2e84c5c8386b393637",
         intel: "9323484665588852bd803332333d683ae6fcd94d93afe97782a13ba13c7b1e20"

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
