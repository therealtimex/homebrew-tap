cask "realtimex@1.1.39-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.39-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f792232f7fa50f73a8eb8f60e3378be70883ac8c6e1ff76deb599c532dd19134",
         intel: "37f1895f65f55d54869d440ef62a7641cb771d3e0c46ffc574ee3bb1aee6e2b8"

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
