cask "realtimex@1.1.647-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.647-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e5b542a60c8d2e2cfabee04a26c393163d1278c754229aa4896cd4d32da682a4",
         intel: "b827f689126b204ee17c1fc70a1eb4532b0e4a10a3fc6807787232146955e8dd"

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
