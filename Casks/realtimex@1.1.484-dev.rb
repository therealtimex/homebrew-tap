cask "realtimex@1.1.484-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.484-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8705f8df401836be4e693b834ffbf54b367d2d0b91860c580cc8f0c739286a69",
         intel: "8d2d0cf7eaf8d61f0cddc8dff76848b923654228004d8e5b578b3347f508818c"

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
