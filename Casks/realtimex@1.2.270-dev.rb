cask "realtimex@1.2.270-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.270-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7a490308e40f04411d8766a6ab8135ea0f3f14000b50f305a3f1766aecb2d139",
         intel: "bbb5aa8913f2606e9d8b13d669a78d9739579a8a65ae7d7c165d83f70ea52380"

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
