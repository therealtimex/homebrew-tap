cask "realtimex@1.1.573-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.573-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "709fe85f1bde222cb32b6144333ae4e831235fa892e1be5b70e58e67f9963c24",
         intel: "771a12bed9d01e1d5fb9dbfb3987e8de6984f4f14c53a674cd17f03fd1a6fcf4"

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
