cask "realtimex@1.1.588-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.588-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c27237b744def338711a4dd3c91badaf85ac590b7afa83d2c657b3af37c74f90",
         intel: "03bc82dec0276cc597e8ead6887145b0b02d8b1c3fb535b889a6363f49ae2806"

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
