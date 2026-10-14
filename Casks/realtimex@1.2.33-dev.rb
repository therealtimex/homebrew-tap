cask "realtimex@1.2.33-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.33-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "4ce4a86ac4999020872c72db60b0e9dc03b2f9a830a4e72eab981d9ae0566113",
         intel: "2342b3fdb47327da56cbc7ff4272d6ad57351e0ed9404079d8f9489592d9b22b"

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
