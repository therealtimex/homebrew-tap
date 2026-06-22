cask "realtimex@1.1.119-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.119-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "39fc9ec2838f4331112585acc6cfa3cf8d3b1efdda5ebe0659f352aa126530ea",
         intel: "ee7c4eefad205773d9694531ec300a6541cb064054c9930eed1eed81a3e94e65"

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
