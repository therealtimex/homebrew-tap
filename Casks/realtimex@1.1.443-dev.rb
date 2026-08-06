cask "realtimex@1.1.443-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.443-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c7701ed373f837152caca453e925136be9d90ae0b9a22c3fae7b4873323817f0",
         intel: "2e9d1b2e228e40ba0802e5ea17023d3e8caa6458496a6cd85b63b2be8e7e87e1"

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
