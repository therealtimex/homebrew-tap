cask "realtimex@1.2.72-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.72-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "38345a6ea4efdb9b619cb30684bdfa8ff13c2063d018a5d3b9d8fe41b9359596",
         intel: "900dd8548138fcb3571fed8492e46bdadf41ac393211d08d7cc927e885f46c32"

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
