cask "realtimex@1.1.375-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.375-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "790c17f892223df94d162aa2ef2c2865b253c1cd2670f98da27ca4abf352853a",
         intel: "3627c43b8b9d9cec5170e5e473bb3f7311e3fe8d04b7b6bcc7983a655a00b3d5"

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
