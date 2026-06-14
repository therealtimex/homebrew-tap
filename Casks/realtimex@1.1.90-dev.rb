cask "realtimex@1.1.90-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.90-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8e739fa66ba968e7948c9348b1249902c944d03ced1e82015795993039fad9a7",
         intel: "5924f5681847698297436af4cb4f1dff8ec78c5c8e4b35a91207c14cca1e81c7"

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
