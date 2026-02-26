ui = true
api_addr = "https://openbao.support4u.se"

storage "file" {
  path = "/bao/data"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
}
