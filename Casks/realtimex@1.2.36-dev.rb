cask "realtimex@1.2.36-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.36-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fa07a60230cd674077aac932eb916b523d5d5fb047830f39fae25dcae06bcb92",
         intel: "592020e36f5947d1f5abbe8f7d0652da71afd31f1edf120872bd559556bd2e3f"

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
