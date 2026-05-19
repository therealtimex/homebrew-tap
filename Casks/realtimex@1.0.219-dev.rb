cask "realtimex@1.0.219-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.219-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4f27591515055aadd280a82830a9c95d013e1d73aad9bdaf811300f30d5fdc61",
         intel: "593f3e2008c6241730434356cfa9499669b6443474c4056f65d4a4f3904cdfff"

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
