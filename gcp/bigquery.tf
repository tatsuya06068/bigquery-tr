resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "example_dataset"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "asia-northeast1"
}

resource "google_bigquery_table" "users" {
  dataset_id          = google_bigquery_dataset.dataset.dataset_id
  table_id            = "users"
  deletion_protection = false
  clustering          = ["user_id"]

  time_partitioning {
    field                    = "dateday"
    type                     = "DAY"
    require_partition_filter = true
  }

  schema = <<EOF
[
  {
    "name": "user_id",
    "type": "INT64",
    "mode": "REQUIRED",
    "description": "user id"
  },
  {
    "name": "name",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "user name"
  },
  {
    "name": "dateday",
    "type": "DATE",
    "mode": "REQUIRED",
    "description": "created date"
  }
]
EOF

}
