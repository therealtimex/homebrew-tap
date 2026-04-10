cask "realtimex@1.0.126-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.126-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "0f8f171a2710307eea2e4e1c83c50c0ad77502ae3e6e5ad992e032367fbada0f",
         intel: "5e5303cbbb8c3498c27bd76b475d3831489b7d9c8ae54f66b75f8bc184db1241"

  # Use the #{arch} variable in your URL
  url "https://github.com/therealtimex/realtimex/releases/download/v#{version}/RealTimeX.AI-#{version}#{arch}.dmg"

  name "RealTimeX"
  desc "Find powerful AI Agents for RealTimeX"
  homepage "https://realtimex.ai/"

  depends_on formula: "redis"
  app "RealTimeX.AI.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "RealTimeX.AI" to quit'],
    sleep 2
  end

  caveats <<~EOS
    RealTimeX.AI will be placed in Applications.
  EOS
end
