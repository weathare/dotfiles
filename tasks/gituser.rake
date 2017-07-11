require "gibberish"

namespace :gituser do
  encryptfile = File.expand_path("./_git.local")
  decryptfile = File.expand_path("./.git.local")
  cipher = Gibberish::AES.new(ENV["ENCRYPT_KEY"])

  desc "Encrypt configure of local git user"
  task :encrypt do
    encrypted = cipher.encrypt(File.read(decryptfile))
    File.write(encryptfile, encrypted)
  end

  desc "Decrypt configure of local git user"
  task :decrypt do
    decrypted = cipher.decrypt(File.read(encryptfile))
    File.write(decryptfile, decrypted)
  end
end
