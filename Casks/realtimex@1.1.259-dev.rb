cask "realtimex@1.1.259-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.259-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8a7f86f80eb27a9d233e1570e27e3ca213ec31661131ced1948ba9438eff36ce",
         intel: "6f91dc5f57233e853e3ca99681f8ed224a925fadacc553774862da90a4233f5f"

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
