cask "realtimex@1.1.569-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.569-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6d54eb645c2041d349466191665bd1ba49068dee7dd18089534763fec76cf26d",
         intel: "1ff7be73ccbf72c10e7e08970b1f4776247ab0361db9bf7cdbd7b960e411983a"

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
