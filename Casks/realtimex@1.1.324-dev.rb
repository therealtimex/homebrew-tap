cask "realtimex@1.1.324-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.324-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "41c9b28c0f95c2c04cfbec98870e9bf8363c8356160760492592afcebeb4c59b",
         intel: "26325153f9e61ba636d1f763145c1711f4fd256f9edb7a93d079c1b029edb31c"

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
