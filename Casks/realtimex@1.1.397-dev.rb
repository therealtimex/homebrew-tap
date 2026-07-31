cask "realtimex@1.1.397-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.397-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "f90cc6b4d7db10f699b9c58105169eba4848a9b50c2c80b059bfb6b7050dab9d",
         intel: "d022fe145c18956b00822ba54df54306c93ef8af2925f62f61a9a09ec737ecac"

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
