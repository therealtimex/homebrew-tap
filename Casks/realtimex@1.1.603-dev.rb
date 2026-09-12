cask "realtimex@1.1.603-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.603-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f0179e34c48f2ee616260bb268e0c93993a7a7d1994bba57002958d7fa41f92a",
         intel: "f375edcc3ed51e29062d0bd9dcd52015001a699246084827d9628c90929d6d0f"

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
