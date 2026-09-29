cask "realtimex@1.1.673-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.673-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "bff2c6347c52d666dfc96dac432a5492b123d40d19f55dfe74d7eacdb35f710e",
         intel: "775bc70754c3cb020abaf35e33d74850e4c4587805ab9f7653efa7f034f057e2"

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
