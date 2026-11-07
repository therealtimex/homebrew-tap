cask "realtimex@1.2.212-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.212-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "524a70966388f6496bffde1d267fc814e7ceeb2a71b1366ff290f48538b43de2",
         intel: "020680146021c00a92cd984f0dfe3b520d1bced3c31ed2d1d3c4c799847bc292"

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
