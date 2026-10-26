cask "realtimex@1.2.123-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.123-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "68bd25f79546cbb3d55c96b3f972fbee372fdefae394e3603af71f15b2872aaf",
         intel: "d8fb29fef80a4b095a2408046552cf6cf19c69fefa09e89662c317a9091c99ac"

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
