cask "realtimex@1.1.640-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.640-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "37798a80ed4c0aa05a08b3d5f91b195528420e4a2237f4784da407f0f6267f58",
         intel: "89aa5e696b8b00a1091a3bb5b2d2002af598355fcf581cbf49f84e5b5dff035e"

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
