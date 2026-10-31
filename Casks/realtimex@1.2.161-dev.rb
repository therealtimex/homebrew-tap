cask "realtimex@1.2.161-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.161-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "435bfaf21d1cd32839f953d00de780659d75bd86802d79f0007710eda617ea81",
         intel: "a49f413b6f0db3808d5b43c6d484a62e6751b7faa08acc1f7f835a27e703d114"

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
