cask "realtimex@1.2.141-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.141-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bdf4e01a2329a485f84b7ea8cc12da7a739a1f2ada6ceeac8750ed7307936893",
         intel: "408d70068128ab9a119d07ae2f5e876f319ca88a1db9e44145e79d94a971bb20"

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
