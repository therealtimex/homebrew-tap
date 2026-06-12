cask "realtimex@1.1.82-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.82-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "48edf9cbfd680d220a2eaa6ec1b71ce2f79f9356a0503bb1d5c3bc0b2d0d41ec",
         intel: "8c6386c05abe20dc62b2d054c6a6220a6fecca15bdadbd24394e5e99fc425d26"

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
