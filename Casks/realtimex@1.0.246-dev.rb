cask "realtimex@1.0.246-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.246-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f5679ddd4156e87144d059a5fd3c7e0c8cfce571161624aa825f132c92763557",
         intel: "f1ce7f98bb53686f872c4965e256f847fa5d0908ccc3c4780ad796623d7e2b37"

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
