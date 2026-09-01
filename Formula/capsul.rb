# Formule auto-gérée : le job `homebrew` de `.github/workflows/publish.yml`
# (dépôt PENRA-CORP/Capsul) réécrit `url` et `sha256` à chaque tag de version.
# Ne pas éditer ces deux lignes à la main.
#
# LA SOURCE EST LE REGISTRE npm, ET C'EST CE QUI REND L'INSTALLATION ANONYME.
# `PENRA-CORP/Capsul` est privé : tant que la formule pointait l'asset d'une
# release GitHub, `brew install` exigeait un `HOMEBREW_GITHUB_API_TOKEN` ayant
# accès au dépôt. Le registre n'a pas ce défaut.
#
# Le nom du fichier n'est PAS celui que produit `npm pack`. En local l'archive
# s'appelle `penra-capsul-X.tgz` ; le registre la sert sous `capsul-X.tgz`,
# sans le scope. Construire l'URL à partir du nom local donne un 404.
class Capsul < Formula
  desc "Context optimizer for the Claude and Codex coding agents"
  homepage "https://capsul.chat"
  url "https://registry.npmjs.org/@penra/capsul/-/capsul-1.2.0.tgz"
  sha256 "0bce4f9deb7c0127fa1b18c3b7d1c84b6e16d586fa6398a06b5e59c299585830"
  license :cannot_represent # propriétaire — voir LICENSE dans l'archive
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  # Vérifie que le binaire est là ET qu'il s'exécute. La 0.1.37 avait été
  # publiée sans `dist/cli.js` : elle s'installait sans broncher et ne cassait
  # qu'au premier appel. Ce test-là l'aurait attrapée.
  test do
    assert_match version.to_s, shell_output("#{bin}/capsul --version")
  end
end
