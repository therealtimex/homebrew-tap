cask "realtimex@1.1.245-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.245-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f86c3fd40991094cb9ad25300e9232792a2b4df389d49ee600d69d9ba9d152ca",
         intel: "6f34abd8478f41dd3331ab296e53dbf87d7f1b9edcccec8a3fe66d4b262d4be4"

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
