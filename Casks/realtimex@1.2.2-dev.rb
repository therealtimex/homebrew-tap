cask "realtimex@1.2.2-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.2-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "964335a03507f545e86ad93efe6b2d0df186a3334360141b75ff604105cc2186",
         intel: "8246ec225d5ff116e1108519d0bbff0d633e5449a111d5b8e26086ad00e1a135"

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
