resource "google_service_account" "service_account" {
  account_id   = var.service_account_name
  display_name = "Service Account"
  project = var.project_id
}

resource "google_project_iam_member" "member-role" {
  for_each = toset([
    "roles/cloudsql.admin",
    "roles/secretmanager.secretAccessor",
    "roles/container.admin",
    "roles/iam.serviceAccountUser",
    "roles/storage.admin",
  ])
  role = each.key
  member = "serviceAccount:${google_service_account.service_account.email}"
  project = var.project_id
}

resource "google_service_account" "service_account" {
  account_id   = var.service_account_name
  display_name = "Service Account"
  project = var.project_id
}



resource "google_project_iam_member" "member-role" {
  for_each = toset([
    "roles/cloudsql.admin",
    "roles/secretmanager.secretAccessor",
    "roles/container.admin",
    "roles/iam.serviceAccountUser",
    "roles/storage.admin",
  ])
  role = each.key
  member = "serviceAccount:${google_service_account.service_account.email}"
  project = var.project_id
}

