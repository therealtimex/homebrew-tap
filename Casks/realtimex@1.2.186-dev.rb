cask "realtimex@1.2.186-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.186-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ca873906914b0b0a531b8e725ad8801f2a1892224f9ebfc71ba143f226a6f2ff",
         intel: "3b0ca5257cff5a10dcc6ffdbb12a569bf432be39f5669d288120f9b03f05d6c7"

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
