cask "realtimex@1.1.250-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.250-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5912378ceec87d53a442af22541852fa8f779a8ac037bc1267eca6bbf3a58c3d",
         intel: "b8824b92a1c01abf49677570d3f1b924c8ad18378a96e5ddf15ed4af5f396280"

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
