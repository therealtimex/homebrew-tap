cask "realtimex@1.1.645-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.645-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a86ad3b032ba7142aa8366f088c8f8344a1c0faa9120fa2126fbbef625a0711e",
         intel: "07b60d34284938411338362c479b98ae0000c46c4a61a11d32aafa6b26edbb23"

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
