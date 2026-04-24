cask "realtimex@1.0.153-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.153-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e1134feb1c3ffc8de8361dd5d4ee4caa213a1ca9c83ff4d4883059b0ac0a951d",
         intel: "6d5069d366cee8c5d23aacda2e1ff0e3d347da0c6444f42791d3b2ed1df2618f"

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
