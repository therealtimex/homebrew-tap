cask "realtimex@1.0.212-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.212-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e2d97cc8ab08c6270023b548d473188e05dafdc579f2df5458275e970691b5e8",
         intel: "664c1b374bd80ef60e1ae4943185415462e6a45be088473bcb2881ed536969e6"

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
