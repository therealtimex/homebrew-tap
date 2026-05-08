cask "realtimex@1.0.189-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.189-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "80c23db9b568ac492edba61bd4758e3dbb78d8e32bb7507dfb8ba8597ab8c44d",
         intel: "bf031d940afe58ce26522110f0a7e7a00ff5fcfa3dcee7424c1c9a59b5fae3c7"

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
