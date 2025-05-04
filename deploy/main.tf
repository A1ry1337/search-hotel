terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.87"
    }
  }
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = "ru-central1-a"
}

# Создание VPC сети
resource "yandex_vpc_network" "default" {
  name = "search-hotel-network"
}

# Создание подсети
resource "yandex_vpc_subnet" "default" {
  name           = "search-hotel-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

# Создание кластера PostgreSQL
resource "yandex_mdb_postgresql_cluster" "pg_cluster" {
  name        = "search-hotel-db"
  environment = "PRODUCTION"
  network_id  = yandex_vpc_network.default.id

  config {
    version = "15"
    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = 20
    }
    postgresql_config = {
      max_connections                   = 100
      enable_parallel_hash             = true
    }
  }

  host {
    zone             = "ru-central1-a"
    subnet_id        = yandex_vpc_subnet.default.id
    assign_public_ip = true
  }

  database {
    name = "search_hotel_db"
    owner = "user"
  }

  user {
    name     = "user"
    password = "password"
    permission {
      database_name = "search_hotel_db"
    }
  }
}

# Создание виртуальной машины для приложения
resource "yandex_compute_instance" "app_instance" {
  name        = "grails-app"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8q8tjpq11liqgdprah" # Ubuntu 24.04 LTS
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
    nat       = true
  }

  metadata = {
  user-data = templatefile("${path.module}/cloud-init.yml", {
    ssh_pub_key = file("~/.ssh/id_ed25519.pub")
  })
 }
}

# Создание облачного хранилища
resource "yandex_storage_bucket" "static" {
  bucket      = "search-hotel-static"
  acl         = "public-read"
  folder_id   = var.yc_folder_id
  force_destroy = true
}

# Создание балансировщика нагрузки
resource "yandex_lb_network_load_balancer" "lb" {
  name      = "search-hotel-lb"
  folder_id = var.yc_folder_id

  listener {
    name        = "http"
    port        = 80
    target_port = 8080
    protocol    = "tcp"
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.target_group.id

    healthcheck {
      name = "http"
      tcp_options {
        port = 8080
      }
    }
  }
}

# Создание целевой группы для балансировщика нагрузки
resource "yandex_lb_target_group" "target_group" {
  name      = "search-hotel-target-group"
  folder_id = var.yc_folder_id

  target {
    subnet_id = yandex_vpc_subnet.default.id
    address = yandex_compute_instance.app_instance.network_interface.0.ip_address
  }
}

# Переменные для Yandex Cloud
variable "yc_token" {}
variable "yc_cloud_id" {}
variable "yc_folder_id" {}

