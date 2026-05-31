cask "realtimex@1.1.22-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.22-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "39fb238acaef3406b25297bcbcfa6c4f762cad5c160f8083bf4baf3e9b9dd36e",
         intel: "a042343691d586bfb08e6a27ba49e9a61644edbe3553549b55f2a82b45b04edc"

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
