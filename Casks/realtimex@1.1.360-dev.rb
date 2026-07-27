cask "realtimex@1.1.360-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.360-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "dfa987b768cdcaf4482909eca255c0a5eeea5b4bcfa863c7a3bb19313180e7fb",
         intel: "87e7fea9a067065657c416fb0febc823757205f5bcd65ac6566303d50f87faba"

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
