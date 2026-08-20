cask "realtimex@1.1.519-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.519-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a47a1da8f76f0894055f9d650d0c9b54e3a951b415f1b9fff7fb5865dc88c86c",
         intel: "ae54f44ce51466d3086ae0f56fa0eeb9d60c4405287dc9278663779716cbd84a"

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
