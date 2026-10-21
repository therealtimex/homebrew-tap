cask "realtimex@1.2.85-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.85-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "463c476e4ebbed6281a99140e587ff89d9747a8c907ae03003ad5b5237628a9c",
         intel: "13165e21f8853a5fe26bae759753d0fab126135f875690521057327a74d3ff3e"

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
