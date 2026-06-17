cask "realtimex@1.1.101" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.101"

  # Provide both SHA256 hashes
  sha256 arm:   "b6db8cd796ea38368796f8afe964d1c00fdc15a548701c42efc78151d67ea523",
         intel: "c52509536db1ea1f64055c5bf3897b5257baf4c6113b9a1ac86d1f91ecdb8a74"

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
