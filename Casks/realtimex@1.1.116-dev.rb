cask "realtimex@1.1.116-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.116-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "575df3c8320ff69596210103c253de3709b1c4ab96bfe4c491b61fecafd10eeb",
         intel: "7e72b3c8b3a7a63f1798ec206c3c05619e68944c811282c9b25d63f8cda20eca"

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
