cask "realtimex@1.2.1-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.1-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "2451a62ebb7542bb4f14ee4d6fbaae1fbae79d515152c9f60dd1a0974d78b0a5",
         intel: "2469927cd197a4442d129011b44e4f220b42182c1abc655e9209315328a46e6b"

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
