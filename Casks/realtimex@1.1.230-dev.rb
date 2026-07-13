cask "realtimex@1.1.230-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.230-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "03fbba05684fe31b46be1c94546e753023483fbcac3b36ad3440fe57a6a85b8d",
         intel: "c769dc45f43e0d62de1466cf517cc9b7e6fc2df14a9aa07356b404bc77d87486"

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
