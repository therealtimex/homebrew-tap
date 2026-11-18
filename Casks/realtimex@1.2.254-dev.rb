cask "realtimex@1.2.254-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.254-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "a47e6889f50b1bfa95369b87c86ba3749afba215973c625f8ff4bc860670d5a2",
         intel: "b1471efa188c3d12767cee357932e3237922531ceaebd94efc80d0594bcf2397"

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
