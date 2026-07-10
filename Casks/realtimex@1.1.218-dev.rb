cask "realtimex@1.1.218-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.218-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "99595b3fd84b9d059a9a816476d8c3683f8e12fec88847f9764b3ddc62f8bfb8",
         intel: "137466bffb115db82e41ac39b9d9d0b9966b9e265a0e1989cd4da4e321a5c50d"

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
