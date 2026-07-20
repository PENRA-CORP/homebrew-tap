# Formula auto-gérée : le workflow `publish` du repo PENRA-CORP/Condense met à jour
# `url` et `sha256` à chaque release (tag v*). Ne pas éditer à la main.
class Condense < Formula
  desc "CLI qui optimise les tokens envoyés à Claude & Codex"
  homepage "https://github.com/PENRA-CORP/Condense"
  url "https://registry.npmjs.org/@penra/condense/-/condense-0.1.23.tgz"
  sha256 "6d5c2488ee50ac3686602fa34da60febe234aff9af9215c439c6206898fe8bac"
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
