cask "realtimex@1.2.261-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.261-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "811649fb1317a52003535d8302afa9beabe0d304b0091cef54925af8af76aaa4",
         intel: "80dce599e9834bdafd0fbfc25165eea712d2e6ac868ab239cca44aee5fd71780"

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
