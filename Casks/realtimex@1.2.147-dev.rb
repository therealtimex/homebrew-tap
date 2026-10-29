cask "realtimex@1.2.147-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.147-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "acab58ce35f40ec8ad17c1b71cd097712a9c1f67c0ab06b1ab822dfd16fb43ef",
         intel: "2dfd922ae522753c574aaf22f8b3de653c490f6ed09bcf7d19502535f7a67f84"

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
