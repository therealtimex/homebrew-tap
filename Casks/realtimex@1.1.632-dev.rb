cask "realtimex@1.1.632-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.632-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "b80dad989425e3d0861cd7862fe71cbe8a75df5df420c094e2c27aa5686765e7",
         intel: "1317135b5393232965703470cae68d335f1580761e291fb8387ee876d09ed55f"

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
