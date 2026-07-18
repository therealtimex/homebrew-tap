cask "realtimex@1.1.296-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.296-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a03e28df0be3eefd36c293968c5d6d4262a4bf3f2ac1b50a219986ea1597356c",
         intel: "82855852344eef27f535402f1e6089b4041a3b7f6521f330b97bd6d9bf3b3a0d"

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
