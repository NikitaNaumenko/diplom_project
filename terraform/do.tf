data "digitalocean_image" "ubuntu_with_docker" {
  slug = "docker-18-04"
}

resource "digitalocean_ssh_key" "nikita_n" {
  name = "nikita.n"
  public_key = "${file("./files/nikita_n.pub")}"
}

resource "digitalocean_droplet" "nikita_n" {
	image = "43543695"
  name   = "nikita.n"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  ssh_keys = ["${digitalocean_ssh_key.nikita_n.fingerprint}"]
}
