cask "realtimex@1.1.232-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.232-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0fdc28ae8e8a664c498f17921f87e8a01e3aec9545b730125176726c76c917d1",
         intel: "48d020e1462804bcfcfa942b8c349be9b9b4db97bc2fd2182b8149f29104959a"

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
