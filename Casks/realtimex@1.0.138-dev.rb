cask "realtimex@1.0.138-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.138-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "75877fccb386246f848a1090da0f4730bae8f2993d7e3aff24d5f7d77832f436",
         intel: "0dac96ea0c733bdfed4f1733f1010a3b1e2181417ea6f66aad4be5340975aa68"

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
