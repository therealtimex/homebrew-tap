cask "realtimex@1.1.442-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.442-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "926aef604c0d5723952290bae4e5ff9e9154b4bd5416fbab9481138e5cb08227",
         intel: "22bf13c8390fbe118ae34360a0606c08fcdf761663844b3fd74fd569bf05ff12"

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
