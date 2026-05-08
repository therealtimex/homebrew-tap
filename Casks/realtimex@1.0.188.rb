cask "realtimex@1.0.188" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.188"

  # Provide both SHA256 hashes
  sha256 arm:   "9eb2942ad984cd2a9a3570908e6e1c72e74e95bd217dbf633adc9c1849a30b1a",
         intel: "deb9f695570be248deac5cceae1a97fbc96685642079dc6dbf27c7bd28160524"

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
