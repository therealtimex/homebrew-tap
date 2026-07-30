cask "realtimex@1.1.392-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.392-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a67cd7209ebcbd3ff881b6809bf118f9c68d442029f3f4cbdd90ce3f6d41da75",
         intel: "a653d225ea36b0c3e70d8e40e74c1ea00c9f502a15f90cb9e9c7c9ad0b0ae593"

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
