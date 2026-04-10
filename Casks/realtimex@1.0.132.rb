cask "realtimex@1.0.132" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.132"

  # Provide both SHA256 hashes
  sha256 arm:   "ee5c0bad4f6c329ae4e1b469c9947ef31afd22324f76dadfe5cb41b09b495c28",
         intel: "022619c57e7841074156ebd671aca0ca6b77b315aed756311c30104512b79623"

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
