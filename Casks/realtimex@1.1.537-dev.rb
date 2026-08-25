cask "realtimex@1.1.537-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.537-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ddc02a44a1fc4cc9cbf72332e9f8b129d301d9baef1eafe5432938c4b9ff4037",
         intel: "5cb611b48130ab797b850b57d1269fcb8edbe3275461b1be4059871502e12a1f"

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
