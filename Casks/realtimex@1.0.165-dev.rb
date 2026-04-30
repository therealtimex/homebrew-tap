cask "realtimex@1.0.165-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.165-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "11b804b2c8fd727a678b53f4bf99500f4fc5b71556209e7c1f86597abdcfd634",
         intel: "fd065ac7d46af7e9fb5c8d436d29a452fcf7e905eb985b0f675d7434cb595964"

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
