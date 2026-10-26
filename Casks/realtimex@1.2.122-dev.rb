cask "realtimex@1.2.122-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.122-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "249d4642246b48b5712b78bf8e72b016e0a6f889e9c6382e091315fd33a2f6c4",
         intel: "99cf9d58990559760c1425a196212bdd5c0e2c2965c9a928e703b771be6a5811"

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
