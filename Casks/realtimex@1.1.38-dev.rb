cask "realtimex@1.1.38-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.38-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c566e9ec8e2496f0abf3d447fd301cba99475009cfdd18baa4ed2a99ccc9a791",
         intel: "5f5bbb723d802861f69e9b4253906308b34c085537d7287b46d03e65754e2bc1"

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
