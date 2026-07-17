# Formula auto-gérée : le workflow `publish` du repo PENRA-CORP/Condense met à jour
# `url` et `sha256` à chaque release (tag v*). Ne pas éditer à la main.
class Condense < Formula
  desc "CLI qui optimise les tokens envoyés à Claude & Codex"
  homepage "https://github.com/PENRA-CORP/Condense"
  url "https://registry.npmjs.org/@penra/condense/-/condense-0.1.18.tgz"
  sha256 "944e38ad1d53856e269a116ea7d96c9cec206d715da73a797f577abf4b9a9799"
  license "MIT"
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/condense --version")
  end
end
