cask "realtimex@1.1.579-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.579-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a08bce68e34014b629baf5f5612493af37d7d450f3e424d56ed5bd6f45b34af5",
         intel: "7637ba7d6a23f7b7bb7b9eb1971e837a569544102d61080a8b0df4989557559e"

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
