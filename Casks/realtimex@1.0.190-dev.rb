cask "realtimex@1.0.190-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.190-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7964361fa3f0c2902fdef02f7ebed43d9c47fee9ca2442607a9492300fe547ec",
         intel: "ce43019944c8a4caa83eba1c99cdd54e59c612bb634e742252e16d0c915637b0"

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
