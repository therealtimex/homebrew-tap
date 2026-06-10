cask "realtimex@1.1.68-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.68-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3317d379aedba1a6e280930215cfec9495604a1630568e04069de783068e73f1",
         intel: "351fc8c684a71d8dd555e1f3eab557235266d44f6e7206c01cc897944046dce8"

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
