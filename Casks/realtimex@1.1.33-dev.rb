cask "realtimex@1.1.33-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.33-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c415ba7c44fc40b64e2809802af288bd3776014b2a5f6f994e5b634dd01005d3",
         intel: "6248975f3e50b626f5a584ad8fecc88566147b637aaee149c11a8a80137c73ed"

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
