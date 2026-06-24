cask "realtimex@1.1.131-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.131-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "857295ca358c9b605829210d4838f8bc9e738483c40eecfc46d4a576fe91648e",
         intel: "55bf86f4fabbe3d9a86f4854de2b73200f62fe3fec57974885b73c006ca5a21a"

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
