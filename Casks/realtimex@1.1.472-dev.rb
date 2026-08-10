cask "realtimex@1.1.472-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.472-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0162575320dd8862b9876245f5fc287fdfb1abdae5c92faa7b2d17bd35cbbbbf",
         intel: "0d12f0ed564c1416184622a5cae89414e54aa587f70d62bb086da681c5abe25c"

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
