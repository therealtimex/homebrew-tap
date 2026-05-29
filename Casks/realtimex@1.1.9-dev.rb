cask "realtimex@1.1.9-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.9-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3864dd39d6dca0f9e8962e0d031433ff3a52506e6e12d4db761b902163aaa381",
         intel: "66861a207d0cae45183ee125978446e9d6172a2283756a536d8ae4a70756b5e9"

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
