cask "realtimex@1.1.402-dev" do
  # Define what 'arch' should resolve to for each CPU
  arch arm: "-arm64", intel: ""

  version "1.1.402-dev"

  # Provide both SHA256 hashes
  sha256 arm:   "eadd096edc97bb861c864f20836110cecce06614b1f9de8ba2d696a0adda95c3",
         intel: "d002fd1f2955c117851e5489168e9168f6fe218aaa08cb4befbcdf9303878946"

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
