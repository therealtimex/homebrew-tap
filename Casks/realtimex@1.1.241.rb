cask "realtimex@1.1.241" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.241"

  # Provide both SHA256 hashes
  sha256 arm:   "ebdf8e7177243a31c7234ca2a6ef60769a1b0dd714dbf5172737b10f02b98fac",
         intel: "d9785c4c1d6221b0ec342bc2979b167ef37466818adcbce7edc12439562a4e7f"

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
