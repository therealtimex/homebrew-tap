cask "realtimex@1.1.419-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.419-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "9c486dae7cb84ae1bb5ce72e7840356a4e0e07e6e87869e81bb0c51fffb6d173",
         intel: "df49dd2c6b5da7e658547518b3fbdef0eeb93b442610f1ec13a41322687c6ccf"

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
