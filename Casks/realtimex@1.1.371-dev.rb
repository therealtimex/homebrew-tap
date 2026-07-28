cask "realtimex@1.1.371-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.371-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "6cdef153dd7ce6fd110b2a8c4f492a44c2fc897c96eaaa94383f1286234b68d6",
         intel: "b8da8a2173b9ff96074c5464829ac8dd5756635ef17c91810131d46ae6f878ca"

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
