cask "realtimex@1.1.637-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.637-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "21a924624cc4508774b7c09ba0b20de56a3ffc3c84ec321436dbb193da3dabb0",
         intel: "67240f9bd711389591d784ca28737a147f4a4728230c4326d7309a968203a2ca"

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
