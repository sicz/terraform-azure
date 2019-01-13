locals {
  app_rule_templates = {
    elasticsearch = {
      description             = "Elasticsearch clients"
      protocol                = "Tcp"
      destination_port_ranges = "9200"
    }

    elasticsearch_transport = {
      description             = "Elasticsearch transport"
      protocol                = "Tcp"
      destination_port_ranges = "9300"
    }

    etcd = {
      description             = "etcd clients"
      protocol                = "Tcp"
      destination_port_ranges = "2379"
    }

    etcd_peers = {
      description             = "etcd peers"
      protocol                = "Tcp"
      destination_port_ranges = "2380"
    }

    kafka = {
      description             = "Apache Kafka"
      protocol                = "Tcp"
      destination_port_ranges = "9092"
    }

    memchached = {
      description             = "Memcached"
      protocol                = "Tcp"
      destination_port_ranges = "11211"
    }

    mongodb = {
      description             = "MongoDB"
      protocol                = "Tcp"
      destination_port_ranges = "27017"
    }

    mysql = {
      description             = "MySQL"
      protocol                = "Tcp"
      destination_port_ranges = "3306"
    }

    postgresql = {
      description             = "PostgreSQL"
      protocol                = "Tcp"
      destination_port_ranges = "5432"
    }

    redis = {
      description             = "Redis"
      protocol                = "Tcp"
      destination_port_ranges = "6379"
    }

    redis_sentinel = {
      description             = "Redis Sentinel"
      protocol                = "Tcp"
      destination_port_ranges = "26379"
    }

    zookeeper = {
      description             = "ZooKepper clients"
      protocol                = "Tcp"
      destination_port_ranges = "2181"
    }

    zookeeper_peers = {
      description             = "ZooKepper peers"
      protocol                = "Tcp"
      destination_port_ranges = "2888,3888"
    }
  }
}
