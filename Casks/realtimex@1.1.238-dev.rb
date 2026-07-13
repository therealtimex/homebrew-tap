cask "realtimex@1.1.238-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.238-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b6ad1abf63feff3c4677973f06e25f5deddfff93a2931f510ea9d3aae402224c",
         intel: "cefa141edd137768bc14f79107ec65cc44488910d7690edd0dea045ef1488e2a"

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
