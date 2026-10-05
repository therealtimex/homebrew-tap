cask "realtimex@1.1.698-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.698-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b49eb50ee17a159331112cbfa1ffdeaf61741a5c2dabab340aebb69309b25f12",
         intel: "0f0c22963c3e884ea496bd58d61901f6d1b65bba54ef6fb5d9c56412061054b2"

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
