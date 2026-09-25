cask "realtimex@1.1.662-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.662-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b6600172dee2832e97641994da004703ae87e66eb90080eff27f4e577d664056",
         intel: "9c8e509528822560a0a9ab4e02773051b485cff657e5db50cc6f983a8e305f08"

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
