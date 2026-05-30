cask "realtimex@1.1.12-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.12-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "107658eb092ced1261cb352fbd37defd67cda6aac3adbab5b5ea874c34712742",
         intel: "cdd3f9a3337f1bf95d984f6a0c7dcdef1e93c90d977410a92860333404bcb1e9"

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
