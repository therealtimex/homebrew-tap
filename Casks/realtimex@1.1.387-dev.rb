cask "realtimex@1.1.387-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.387-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6cb06b9721ca94ac8a192a3f45b43bbabdc9697d744773aa73845fd75420c100",
         intel: "5e6a3af6cd0ffda20aab818126263a5e26dd25e75e49f80817dd4c9352cbd5b8"

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
