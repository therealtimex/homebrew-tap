cask "realtimex@1.1.373-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.373-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c3ca26d5700c5cf161fec70744d3d5f9e48bc49c5a394fba6de163ec96582c43",
         intel: "c9128abc09f3fac8ee88fc42bfc01c2560da818246d5ae2560edd8075374bb69"

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
