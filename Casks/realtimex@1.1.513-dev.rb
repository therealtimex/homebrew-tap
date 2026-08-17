cask "realtimex@1.1.513-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.513-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c4bbdf3fd314729842698fc554f537b7d349b9173737b788be9d75675cccbaed",
         intel: "e7377ef2e656dece01ecb925f48f0891e6b3a091ed8130298eaa2258e2732b63"

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
