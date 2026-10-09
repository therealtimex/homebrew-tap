cask "realtimex@1.2.5-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.5-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0a3d676aa44c50bae2b52ead7124ff7392b00b002376fe68f3a04e3371a54969",
         intel: "fbbceace8d8db29dc912aceaa4fde8c0c5bfc9b9e550271790b6cf764af8adf1"

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
