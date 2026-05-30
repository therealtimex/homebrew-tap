cask "realtimex@1.1.14-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.14-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "8b875aecd7ef0293640d99786ad7399be1d5489fc63f80f8d077464471a41f4b",
         intel: "8a357026bdfa72c1ae2e557a4de96335b7a13e7323e940f20d3de89dc29ce695"

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
