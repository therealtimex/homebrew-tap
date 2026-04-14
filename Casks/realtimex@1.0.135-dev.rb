cask "realtimex@1.0.135-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.135-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c711d4bb16c110295b9f6d7dd47aa016c9ba1f6dae72deda3d38a713c5f8a03f",
         intel: "6e8b3b9a0268911e125260874699ee3a0c8aa8db0646a94cb2d195ec62c6724b"

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
