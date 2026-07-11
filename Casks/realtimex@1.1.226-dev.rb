cask "realtimex@1.1.226-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.226-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "27fc54c5f550dad0817a06370560875bd7707a64589dd4acc6621b26b881b996",
         intel: "7ed62430e58af1f3da3a7dffdcad9d8e79e0cca7804d45c2514e21e640f1771f"

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
