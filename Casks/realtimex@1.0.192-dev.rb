cask "realtimex@1.0.192-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.192-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a96ebde953557b158143b8d3d77a02675791999f308da730c3149aca78e46c35",
         intel: "fb83088fe398f5dfff94fece21337f6d305f3dd103f51de1c9f430f1614b0cca"

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
