cask "realtimex@1.1.35-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.35-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e9cc09aa1abe72f90dfee039adc4cee5509e1f793fffa886edb8c9388cd49e00",
         intel: "3fadc65ef5fdcd3053f50000a86967e36bbe89a501af77109a9a12af4879c2f4"

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
