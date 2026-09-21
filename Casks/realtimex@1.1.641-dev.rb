cask "realtimex@1.1.641-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.641-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a128b5824eaf1588407800b905ffd125c2c79f323bca40433051f1cd6b835c81",
         intel: "b58dc474da463ed9ee78391dfe53edb6b69ed0a88489677c85a069fb747844ba"

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
