cask "realtimex@1.1.13-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.13-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "682e181ef716a417ba6f57705485c719d36329ee4653127914f64c4de521b2bd",
         intel: "8f45465b857847ae756a4335dd4ef1b3baee1e06ba254777623430b43cd8594d"

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
