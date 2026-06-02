cask "realtimex@1.1.32-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.32-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5a941e3ea7b080f915a22c18ad71afd73cf1da3c7cb5720b39676ca1797d786d",
         intel: "e74bd044a6ac13b5b8a38e68090e96edaf6c81643998c33e108e2204f035a509"

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
