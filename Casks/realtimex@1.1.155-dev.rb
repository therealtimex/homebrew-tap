cask "realtimex@1.1.155-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.155-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0ac1973efbe9c272938769d8998231ddffad6cc4be26d44ff67bf5e2eaf59ece",
         intel: "85344e3a79877bf5da2c5c81d82f07bb47115d84ba4e7d0e8ce3dcd4c3af6043"

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
