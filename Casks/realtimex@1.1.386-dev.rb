cask "realtimex@1.1.386-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.386-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "75a03b64433a5d743819a93fcf30b8d8827f35077629556448bdb70716d0eb56",
         intel: "d01f308505ef097a7bfe46a488d965e744d4fabc7b765566433c4661178dee8d"

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
