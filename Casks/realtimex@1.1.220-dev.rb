cask "realtimex@1.1.220-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.220-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b6d993c6bf6069d6f8864878ae0454b13a4f3ae725c925d928fef18690b266d3",
         intel: "edf19f0e980420463395ba2211b4b69ee4ea5c28808db5713ab93eb22e8c398e"

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
