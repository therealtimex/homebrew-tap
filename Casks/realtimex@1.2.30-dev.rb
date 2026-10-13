cask "realtimex@1.2.30-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.2.30-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "41b1c1002bcc255e0cf907d0f52713aa3ec9d1523528c135ea851ce53c808026",
         intel: "5eb0039b923fe5ab72013a4da44aa168a1433d2ae3d7b24d2273f4afd5c30e3e"

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
