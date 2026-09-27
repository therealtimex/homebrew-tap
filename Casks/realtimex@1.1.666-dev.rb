cask "realtimex@1.1.666-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.666-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "510845ed5c8714dca80fd4d3d6c552bb6ae2ba11c1ba1eb36e80b121e2b0b268",
         intel: "e32640b571aa1d80607fd6b1702efaa047fe4671d7a967ffc0f9f8370e608d20"

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
