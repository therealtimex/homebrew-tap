cask "realtimex@1.1.49-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.49-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "07a2a18e4d8c1973d31b22c0e94af2ebf464405d2c681845dc60d907af073630",
         intel: "010808a194a9194c84311069df6021b243a08ea58d31da2f016122f5dbc28c08"

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
