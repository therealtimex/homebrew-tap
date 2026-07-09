cask "realtimex@1.1.215-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.215-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "cd962714e0e564bfbb48c6447f9a827431c525e4f17b562e1dc63a82bbf0804a",
         intel: "42010b229be0e46b18f8721e1a35af73685b9b61f565e7e580a1c3316ef5ed3b"

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
