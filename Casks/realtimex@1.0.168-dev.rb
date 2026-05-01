cask "realtimex@1.0.168-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.168-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fb1232cb4e3e3d7a49abd56933a49a7a3c801d1681951cd87b4920ec16bcbed4",
         intel: "dfd4a591844d73db20e97b36df58a47cc342d78a510cd6f9b0badf3be6e5d4cd"

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
