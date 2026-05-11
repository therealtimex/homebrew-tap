cask "realtimex@1.0.197-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.197-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6d8adc8babecad287c2d94cb38ac44bb7a85c18ec824ceb8b129f77febe65e63",
         intel: "99c0f90c1f7bd60ea4da3b4528418f057378f3264b3554a0dc156734ce8a9814"

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
