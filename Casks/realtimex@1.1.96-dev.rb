cask "realtimex@1.1.96-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.96-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "55be67bb8b7bcadec1b3dd8c7cdaf2b2ee7a9034c4fad3f7622d561e88ae2e61",
         intel: "f1e903fba3b68201396554a49655fd924e2774cc3841f142278f77c7770d248a"

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
