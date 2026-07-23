cask "realtimex@1.1.337-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.337-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "538a3f94c7af8b36488681f659d495c2c7a3177f1a8c5d94dc1edcc6e41f0028",
         intel: "14896480a3ab9839bf15838ddfa564565f9d958ab4d020b1836414486b70b52d"

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
