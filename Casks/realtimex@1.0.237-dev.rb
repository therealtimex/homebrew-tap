cask "realtimex@1.0.237-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.237-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8890b60b6933f4bedc4b6bca3221734fa68caea52db92e68a49f7f800b146c24",
         intel: "2f32e883641b3a952072a0ba593ab8250154d9bb149f113d5691e68144bccdbe"

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
