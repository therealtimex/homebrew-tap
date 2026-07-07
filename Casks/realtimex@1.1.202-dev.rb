cask "realtimex@1.1.202-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.202-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f57d4ea66d9e8d524955665ee685366f059b38a30e7e8d82841f82133c287341",
         intel: "d9829212725da04e39adf6c11c7a0f4834e872a7bc98793956808c3f7f85bd44"

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
