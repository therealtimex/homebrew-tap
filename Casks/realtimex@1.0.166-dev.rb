cask "realtimex@1.0.166-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.166-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4eb5386d80db0beaf2a0693008d2438694f661691cbf17869ea858ba258b2264",
         intel: "cd979481dec990a14b06f307d0bd1ce42f13d343fb4f3d2f09da4a5f4a6483bf"

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
