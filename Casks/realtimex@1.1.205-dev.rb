cask "realtimex@1.1.205-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.205-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "934ba63664f5d6fbcb23016ab2c155feebb35d9074735eca8b93e1394f6aca6e",
         intel: "3317b50b8bcdda84ca08829123cc12187270dfb0cc7378e5ef9bb2ae2021eb64"

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
