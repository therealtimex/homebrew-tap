cask "realtimex@1.1.184-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.184-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "af27bf0667e347d86b9261aa9038e8da45ae8df137198e02cbe3cebd96c63b57",
         intel: "1d1323d347c0bdc856fc4594bf25deecf678ce79a65622f077132a5a6dc09cde"

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
