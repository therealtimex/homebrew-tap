cask "realtimex@1.1.704-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.704-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "04ba8ec6752ca4c876b67832c2a8993d55cb64bdde56cff1e2d6b25ec0ce09e0",
         intel: "73f5cbb847ee315553ecde6fcbc83a32ccdd6b0da24d5cc866b337f768adb3eb"

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
