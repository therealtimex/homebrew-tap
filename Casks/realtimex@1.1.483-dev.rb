cask "realtimex@1.1.483-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.483-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "657bc595b2c4133ebea87d3ba4b57515bfd2e3b8959af1be066d62dc275fd48f",
         intel: "fd2e817dcb145fd8a119c2c2e0ded36202f54790a95ebce730faf9e617877678"

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
