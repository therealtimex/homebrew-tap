cask "realtimex@1.1.616-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.616-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "310daab064b6f98763228cd2aa392b1ce561dc29f2473063f6c34d8b4299f67e",
         intel: "aca63debccdac7292dbe72fa9f108c1fc76f87d3f877f0035c7422ece4f4d4bd"

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
