cask "realtimex@1.1.514-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.514-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "708ef3e2c973c21574ab385b36079a21d334d677b31c551a96d3da3b85026823",
         intel: "249ecf6ac16c35057d374ac7a07bbbfe40f47001a6a2373eaec6f35d754319a2"

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
