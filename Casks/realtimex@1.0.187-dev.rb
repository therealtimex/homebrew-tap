cask "realtimex@1.0.187-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.187-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1bca47f07f68b48e55bf2d7e68598c0f171ace73575d3b18385928599d65622e",
         intel: "db18ba226c36062903f745e4e7703bee6745c19cb973775d10e1cc36d76f110b"

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
