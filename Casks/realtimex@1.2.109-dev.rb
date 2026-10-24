cask "realtimex@1.2.109-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.109-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0ef6a00428c2f5c1da79f955cf0dd0c17d8c6a132bee7be266140e55aaa74700",
         intel: "79defc670e4bf70031e87f7ce30e77f29573a7f8b181e927f8fec6a3d317a574"

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
