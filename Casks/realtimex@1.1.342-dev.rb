cask "realtimex@1.1.342-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.342-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7db8ece8e03b5900e3ba30fefbe0f0cea46a4ea2d0d985cf41d70bbfb3400056",
         intel: "c2f0e5e1ffbf1e8b3c6e89608b0aec71b404f7e37858d109a66068d9ea31e716"

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
