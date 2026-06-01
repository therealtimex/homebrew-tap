cask "realtimex@1.1.31-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.31-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "3a22b24d71670293c4bb04d3d7f37d4f8aedf0f00168dd3d93643c3b6bef52ef",
         intel: "4b810bcbcaf22b54a538ce735a72f279a54d60fcb73cee60d02d1821d466dd5d"

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
