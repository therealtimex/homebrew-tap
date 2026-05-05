cask "realtimex@1.0.174" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.174"

  # Provide both SHA256 hashes
  sha256 arm:   "e5b42399bb7041527ae4a4d6b90fbd63c3deed8ff943e9c37bbadc2c51273d60",
         intel: "ce8d54c4d0f2da07156f6cb0cfa8f9ca170675c94d759e34075feae8a5b99ad9"

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
