cask "realtimex@1.1.508-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.508-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9ed488a269bd310e582a7169099d66ef105e2fbad454254c3457670a0844d85c",
         intel: "23c08e5386d9cc23c03023ada3aa41ea4fe46586e65e83193c36d88f48f2cc3c"

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
