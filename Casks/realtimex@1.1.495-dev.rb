cask "realtimex@1.1.495-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.495-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "565d97b081a52e805567fdb580c1e4bd2a53b65c1e90c3a723d211ee245b01e5",
         intel: "1dfdf45688cdb1aebbe89f9054bf121161c6a02ca329af68b17e17e72d448edc"

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
