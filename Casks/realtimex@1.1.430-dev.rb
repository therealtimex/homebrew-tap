cask "realtimex@1.1.430-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.430-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "387ac7ca1735c4984b53df4d55b051c5007d03412582c5a59f4dd9d1979a5a54",
         intel: "ac52fcd49e59118c522ee61280f604999caaa3afa3f0ffb64cd54ed1b4c4a730"

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
