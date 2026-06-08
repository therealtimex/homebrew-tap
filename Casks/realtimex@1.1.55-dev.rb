cask "realtimex@1.1.55-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.55-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e682bb1e21f7a62748a4cb82e0aee9dd47a855b7878a7fc72196851e9a2a3917",
         intel: "a868020de1411d563fd2790ee76dd67dddd626b0922a324b556ba2e80e708601"

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
