cask "realtimex@1.0.136-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.136-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "804e246c04e738d806d6997acad0600e1cf0930a88afaa3d467694d5a965f9a1",
         intel: "62435ec9af6ed51f322ae6d9f0c909f751db0ca959efe65921a05e2dc51c4cdd"

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
