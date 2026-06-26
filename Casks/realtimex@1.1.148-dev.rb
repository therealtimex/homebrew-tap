cask "realtimex@1.1.148-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.148-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "43338ed09f55b7bfb513198d2df13d42a19fe2594b2e53372abfa82e94210466",
         intel: "1ea31887e3b972e5136d8740c7cfd8fb724c98e3a7bd6233486ee2946d896845"

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
