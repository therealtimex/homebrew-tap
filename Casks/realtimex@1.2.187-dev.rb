cask "realtimex@1.2.187-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.187-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "73cf1c79a3e5c3b184e991fd186966170dfc78f865db8d37ea2874e0e6128966",
         intel: "8e56c4dcdb16a205cb6c0c12d569f588598e8b483f840215b1c7364879dd2204"

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
