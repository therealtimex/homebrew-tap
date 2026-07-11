cask "realtimex@1.1.225-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.225-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "5f32d83c104e5ff91741935eb572352a01e0d43470526638c82140664e76ae36",
         intel: "04d3dcb9440ff1ec975b7c11545496e207a1982a7561aa0d025127d08c916f5d"

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
