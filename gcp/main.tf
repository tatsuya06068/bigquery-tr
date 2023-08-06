#terraform setting
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google" # terraformレジストリからインストール
      version = "4.51.0"           # terraformのバージョン
    }
  }
}


provider "google" {
  credentials = file("./credential/tatsuya-fujisawa-c9818d835fc2.json")
  project = "tatsuya-fujisawa"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

# resource "google_compute_network" "vpc_network" {
#   name = "terraform-network"
# }