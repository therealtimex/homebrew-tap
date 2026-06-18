cask "realtimex@1.1.108-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.108-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "89793dcedc2636684f77cbeb0e8c05c1e474d0a5bfd4e3ff20f18d5ea031e017",
         intel: "c424b00d421602c5c2a115ef95739b1890a33c3d91c797256686ae367549b5e1"

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
