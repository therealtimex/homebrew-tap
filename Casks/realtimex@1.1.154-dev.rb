cask "realtimex@1.1.154-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.154-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1eb0c30426709bf938e3bc208351226c33e6e16215abab1985660f6f8a8c4b1c",
         intel: "16641fca4f25c4565f438810fc9211889f229becd0c3f13f761236c08c2d8839"

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
