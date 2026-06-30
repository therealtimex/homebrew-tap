cask "realtimex@1.1.162-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.162-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2053d2c5b4a01172e738a08476c7535239367ddf959b26a3aa2870c240b81f48",
         intel: "09dd00767072eba300a2bf0050847179ef56bb0b8dd21c78426e309b4531d1e2"

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
