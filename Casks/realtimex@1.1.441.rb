cask "realtimex@1.1.441" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.441"

  # Provide both SHA256 hashes
  sha256 arm:   "95ec2525eeb620f369fa3f5c70332c84b27d457804f94d9ec3f052375b30bf4f",
         intel: "5ad0b23545d9b41463638108fc28a788003edb000549aaa5a3fcaef2aef81f8e"

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
