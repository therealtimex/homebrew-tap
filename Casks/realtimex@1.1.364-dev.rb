cask "realtimex@1.1.364-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.364-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fe6319345678ebaab702eadcd06a4c4628d232bd27bcaa7501141954ef1a4db8",
         intel: "3004f78799f64792239924db3c175588d3ec2975b20b02c60e23ef1b2669574e"

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
