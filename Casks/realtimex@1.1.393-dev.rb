cask "realtimex@1.1.393-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.393-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "22509b07567348c372199c18ff2d30282923db3fdb458f882fcb468b2cbee99e",
         intel: "00a82ff2fcf77aa1234f842b06f660c4e12e9f37256459ab3aba1382c0d918d4"

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
