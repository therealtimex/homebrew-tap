cask "realtimex@1.0.211-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.211-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "e5fb87b2300a48b97f219566cb74fad040da8ae8445a674211e2ef4eef4af34e",
         intel: "30ea36ff7c77052c4042b049c04f21a577f315e1b317c4a1bebe76b6ebfb4dd6"

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
