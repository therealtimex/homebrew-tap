cask "realtimex@1.1.206-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.206-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "7f8c8cb4f40bc7d182e062cdaad87f57f46cb01bfcabdf8d22e76d18acb0a610",
         intel: "a0a193e1d29cbadad7fe203f98fec3c3b06471d60d53af1a8f785e46ec385711"

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
