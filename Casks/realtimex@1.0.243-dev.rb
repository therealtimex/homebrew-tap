cask "realtimex@1.0.243-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.243-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ad421cceec76aac8eedb224d2a6f7e3c0d97245081eaa670fa6491ea65e5f1fb",
         intel: "67afbdb5a68a0adc68c3fd105c8db509287c703a30c3becb153a376fe4934a11"

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
