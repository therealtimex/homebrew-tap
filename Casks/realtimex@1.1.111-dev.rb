cask "realtimex@1.1.111-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.111-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "157f948739661f56bcd40a34eacdd534ad985aa643a9a74dbbb775f42dd8bb0f",
         intel: "76c226a001df215e9b2e2417c8074d3e4e52828db7abda47d92d249511a957a8"

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
