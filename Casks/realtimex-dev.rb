cask "realtimex-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.73-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "444bc3529ec0f2a93eef60cf80b4e7fe435a0d1d9aa7c895941036c222401394",
         intel: "c0ddfcb18e752e946d16bc3cdc75e343a97ae4d17737a6f3e04ea0fd0bef1278"

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
