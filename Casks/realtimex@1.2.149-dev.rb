cask "realtimex@1.2.149-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.149-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "db81fb50f91a2f211f34643d24ab99df1b303347d2214853887d58bcba7071c8",
         intel: "747f2eaa29f89ee1696b38933ad65cd4b4b872b6df3774712985e24b4940fa8f"

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
