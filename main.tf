provider "google"{
    project = "antonucci-devops-iac"
    region = "us-central1"
    zone = "us-central1-c"
    credentials = "${file("serviceaccount.yaml")}"

}

resource "google_folder" "Financeiro" {
    display_name = "Financeiro"
    parent = "organizations/1092836737584"
}

resource "google_folder" "Software" {
    display_name = "Software"
    parent = "organizations/1092836737584"
}



// Bloco Salesforce

resource "google_folder" "Salesforce" {
    display_name = "Salesforce"
    parent = google_folder.Financeiro.name
}

resource "google_folder" "Desenvolvimento" {
    display_name = "Desenvolvimento"
    parent = google_folder.Salesforce.name
}

resource "google_folder" "Producao" {
    display_name = "Producao"
    parent = google_folder.Salesforce.name
}

resource "google_project" "jairoantonucci-financeiro-salesforce-dev" {
    name = "jairoantonucci-financeiro-salesforce-dev"
    project_id = "jairoantonucci-financeiro-salesforce-dev"
    folder_id = google_folder.Desenvolvimento.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}

resource "google_project" "jairoantonucci-financeiro-salesforce-prod" {
    name = "jairoantonucci-financeiro-salesforce-prod"
    project_id = "jairoantonucci-financeiro-salesforce-prod"
    folder_id = google_folder.Producao.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}

// Bloco SAP

resource "google_folder" "SAP" {
    display_name = "SAP"
    parent = google_folder.Financeiro.name
}

resource "google_folder" "Desenvolvimento" {
    display_name = "Desenvolvimento"
    parent = google_folder.SAP.name
}

resource "google_folder" "Producao" {
    display_name = "Producao"
    parent = google_folder.SAP.name
}

resource "google_project" "jairoantonucci-financeiro-sap-dev" {
    name = "jairoantonucci-financeiro-sap-dev"
    project_id = "jairoantonucci-financeiro-sap-dev"
    folder_id = google_folder.Desenvolvimento.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}

resource "google_project" "jairoantonucci-financeiro-sap-prod" {
    name = "jairoantonucci-financeiro-sap-prod"
    project_id = "jairoantonucci-financeiro-sap-prod"
    folder_id = google_folder.Producao.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}



// Bloco Back end

resource "google_folder" "BackEnd" {
    display_name = "BackEnd"
    parent = google_folder.Software.name
}

resource "google_folder" "Desenvolvimento" {
    display_name = "Desenvolvimento"
    parent = google_folder.BackEnd.name
}

resource "google_folder" "Producao" {
    display_name = "Producao"
    parent = google_folder.BackEnd.name
}

resource "google_project" "jairoantonucci-software-backend-dev" {
    name = "jairoantonucci-software-backend-dev"
    project_id = "jairoantonucci-software-backend-dev"
    folder_id = google_folder.Desenvolvimento.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}

resource "google_project" "jairoantonucci-software-backend-prod" {
    name = "jairoantonucci-software-backend-prod"
    project_id = "jairoantonucci-software-backend-prod"
    folder_id = google_folder.Producao.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}

// Bloco Front end

resource "google_folder" "FrontEnd" {
    display_name = "FrontEnd"
    parent = google_folder.Software.name
}

resource "google_folder" "Desenvolvimento" {
    display_name = "Desenvolvimento"
    parent = google_folder.FrontEnd.name
}

resource "google_folder" "Producao" {
    display_name = "Producao"
    parent = google_folder.FrontEnd.name
}

resource "google_project" "jairoantonucci-software-frontend-dev" {
    name = "jairoantonucci-software-frontend-dev"
    project_id = "jairoantonucci-software-frontend-dev"
    folder_id = google_folder.Desenvolvimento.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}

resource "google_project" "jairoantonucci-software-frontend-prod" {
    name = "jairoantonucci-software-frontend-prod"
    project_id = "jairoantonucci-software-frontend-prod"
    folder_id = google_folder.Producao.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}