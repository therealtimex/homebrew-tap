cask "realtimex@1.1.133-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.133-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cef71dc94077155616c8ee84cdb767b9294a3b5d4de4d453208a6a179f2d3711",
         intel: "7de4f83b85f899ce26176fbbd846740237b74f1081a920deb21b4244e7532155"

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
