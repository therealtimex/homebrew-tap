cask "realtimex@1.0.170-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.170-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "97049b28df4eb187162499591b5bede1ff916d29ef776dd68b76ab10fb3ccbb4",
         intel: "e87a229e2d1efa22bb2c84ea1b13c9102e42a5d366e5a191b6721fdb7e487e60"

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
