cask "realtimex@1.2.8-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.8-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "80709c1b4191dee5f80e6c406ccfee6fc6215bd77d11b57d2279b36b84408eed",
         intel: "d6e073660afac0860817b7728eab393980a49196b7592cde3e30a9ac4f248274"

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
