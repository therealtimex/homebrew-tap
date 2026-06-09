cask "realtimex@1.1.63" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.63"

  # Provide both SHA256 hashes
  sha256 arm:   "759d99873d973301d3cb59808e82d387c0e15d05862dee0e90972a921dd10cf0",
         intel: "4fc5640a0e818c79fde8b466e9ab33dc71ced1dd38cfd9b47bd7ac654729c23e"

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
