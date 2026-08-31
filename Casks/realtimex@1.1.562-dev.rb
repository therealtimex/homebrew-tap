cask "realtimex@1.1.562-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.562-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "c82ab70d23f0a47a3565276ce6be4aa164b0217555a725520175ef4b94952177",
         intel: "e0d55cf98dae7a951e49ab1f9fe6d3b93af52541bea16f8d5b9caa922790cff5"

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
