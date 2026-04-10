cask "realtimex@1.0.129-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.129-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "946abf1c77e34d7c7d0774a1ba63d7ebd9ec2dc311f3ced69c5743836c74e0c9",
         intel: "a4ebae72a0cdda81348e774a0617ed28e258ddea1aa6552682a10976a1b80afa"

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
