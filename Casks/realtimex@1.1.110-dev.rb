cask "realtimex@1.1.110-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.110-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "1a8ce205006a395bbd07cf82a081196e0ef7c2a4db542a03b0d8bf74b5a086e4",
         intel: "46e29e9f754aa955f7ceec855a8f7a8337633ecdd26933905e3bbac599c0d072"

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
