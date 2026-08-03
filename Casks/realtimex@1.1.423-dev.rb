cask "realtimex@1.1.423-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.423-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cd7a3f46259638d7ef9feb9820daf3985b17effc119229fca8c7c59e2e90f3a2",
         intel: "0ec41eea61beb7d1c2d8668b2ee43c5945644b573124522c6956582fd8ef87da"

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
