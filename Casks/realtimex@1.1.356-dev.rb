cask "realtimex@1.1.356-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.356-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "fc9f0d8a85aad267a8c54b443ec01f70630b4c9d6b60e5c566f91f2f72d23c60",
         intel: "462c8604e13da6ee7270f338ca2487a36d10b1d513dea523aad7d48c71838215"

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
