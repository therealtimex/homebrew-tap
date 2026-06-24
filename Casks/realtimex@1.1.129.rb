cask "realtimex@1.1.129" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.129"

  # Provide both SHA256 hashes
  sha256 arm:   "1c30435aab05eb0fdd214c844f97c9efee38b5dc1c241b9897b40c9c1f23c94e",
         intel: "f94aabc6adfbc7e384b0274c3fdf078f028bd6326d44026035380e7d63f1531e"

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
