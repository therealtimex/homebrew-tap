cask "realtimex@1.0.214-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.214-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "737c4ff47c336d368ced8cc0f43e6fa5f92891cfd98e001c7a7e2174cf973036",
         intel: "da901785e67386071a6279b06215603c2cf7794b42ab82276f01f5f0609696a9"

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
