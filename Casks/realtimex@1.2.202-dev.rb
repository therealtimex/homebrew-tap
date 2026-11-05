cask "realtimex@1.2.202-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.202-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cb3752d86436f6e7f714b54718c3387452b811d5bf18e48a69547690cb0144f2",
         intel: "8cb7dc98645ec6aa987bed4471a6d22dc31278733e43996e6fe64d4fd8a29767"

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
