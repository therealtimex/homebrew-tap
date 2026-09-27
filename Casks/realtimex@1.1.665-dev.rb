cask "realtimex@1.1.665-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.665-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7e0596700ecbe9f517158c940cfca183074976d1d28a37cfa02f0a72e3ff21e3",
         intel: "5b55fa2b4c9d59870176d42bfe4e5d3fb274168cc322ce6c6985c885a0e7f860"

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
