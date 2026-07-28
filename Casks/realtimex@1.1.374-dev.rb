cask "realtimex@1.1.374-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.374-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a779707505a72d811d5568667cfa9e8dc6e23f6bce0edab9033798b593e269f5",
         intel: "0717b025e45b45ffa8bcf6f70fff878c9c41f99e8ea997a373e278192475e040"

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
