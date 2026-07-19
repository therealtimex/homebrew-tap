cask "realtimex@1.1.307-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.307-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "924ded7e9b9eca631ea3af6028a96b7dd125cb89f230cb04c1ca4c82f64b4f21",
         intel: "bc4a2ac9cb93e15cb6131c111f2090c8cefe74e17d273ff764e0f188d1fffb85"

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
