cask "realtimex@1.2.34-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.34-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4e24cdc4c38aac131ee5b9363cdf7e6ea783f04e952399b0d73f7860802c590c",
         intel: "303abfa1e2cee8755337e7cf4b4bb6371906833d17f16200ded8bb9dc3dfd354"

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
