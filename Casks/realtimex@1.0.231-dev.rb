cask "realtimex@1.0.231-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.0.231-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "d1cb815a54823da190f778c16a860c1a7a312b01ac5749a4e3b41c6237507441",
         intel: "046cd1e6c034cb03d8f0b135e6b3a1c3c514801b7b48a85a5374f4774273c95b"

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
