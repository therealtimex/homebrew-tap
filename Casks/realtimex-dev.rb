cask "realtimex-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.153-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ff629c4c2621057f95c0d320ef0141f2d4a714ee1b68c3f3297f8b70de4c4235",
         intel: "6fbfadaf4646d7f5fe6224e59365c7214713e43958b469a2c1c1b94953a4815d"

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
