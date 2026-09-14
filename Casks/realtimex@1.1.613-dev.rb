cask "realtimex@1.1.613-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.613-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "ab1af6516fe2a1ef999d57399a50cd5268cea3ca90a0cb27fb700d1a1e259b03",
         intel: "7b18cd7e9459da80bee42bb7435368fe84116ef4de5ba127df94862390b6695b"

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
