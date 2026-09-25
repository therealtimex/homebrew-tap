cask "realtimex@1.1.663-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.663-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "25939ded3fe6874133cb4221a8b8cc6ada14db260ed74c75044eae3056587859",
         intel: "caa994fc81053b1231cbe220081cee8d3c4446181c07eba5ff19e7a6d694dbcd"

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
