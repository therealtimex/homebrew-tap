cask "realtimex@1.1.674-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.674-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "13efc30ea2bc180362d7de2f28942757e7ad6e29cae2284933ea529e8e9b59a7",
         intel: "0e7d0bc5b61a7420fe55cbc930ce0fabf1426f2203aedd719a16dedda121ee27"

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
