cask "realtimex@1.1.539-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.539-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "177b22f472ceb83e45758da976676a745b6ff6fd8242c76e54d76dc4905c2b37",
         intel: "55384264770d6cf4387848ab7be2ce0295b58e4f4ca2d7a6d96b464478dc23fb"

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
