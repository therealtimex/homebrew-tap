cask "realtimex@1.0.130-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.130-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1d2739a83f2d1179ea8b7a7b87704e1645be49290371335cb7671e409b39f88f",
         intel: "0faa75ac44d059f722cb21b512388242fc69d364f14c4263cc71166964abc5be"

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
