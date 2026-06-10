cask "realtimex@1.1.65-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.65-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fcab6cfe7059afa4f4871614484eed119579cc884da8f26cfcb7e84bdc14ef39",
         intel: "7a4a97e45ae6731e514698b5d24c3a9c542974e0bc3cd82b4282aefe1d093455"

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
