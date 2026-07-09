cask "realtimex@1.1.216-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.216-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "693d5d362238d982e5aa8d8e3df401daadb40e7e64161740285c67a9c56e0eea",
         intel: "0c425441a7502307e9e12d3b08bce62c39003bdbfec2807f92732b5aeb56e801"

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
