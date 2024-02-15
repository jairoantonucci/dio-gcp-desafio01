provider "google"{
    project = "antonucci-devops-iac"
    region = "us-central1"
    zone = "us-central1-c"
    credentials = "${file("serviceaccount.yaml")}" // Inserir o arquivo o .gitignore para que o mesmo não vá para o git

}

resource "google_folder" "Financeiro" {
    display_name = "Financeiro"
    parent = "organizations/1092836737584" // Localizar o ID da Organização no Gerenciamento de Recursos
}

resource "google_folder" "Software" {
    display_name = "Software"
    parent = "organizations/1092836737584" // Localizar o ID da Organização no Gerenciamento de Recursos
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

resource "google_project" "antonucci-salesforce-dev" {
    name = "antonucci-salesforce-dev"
    project_id = "antonucci-salesforce-dev"
    folder_id = google_folder.Desenvolvimento.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669" // Localizar o ID do Billing Account

}

resource "google_project" "antonucci-salesforce-prod" {
    name = "antonucci-salesforce-prod"
    project_id = "antonucci-salesforce-prod"
    folder_id = google_folder.Producao.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}

// Bloco SAP

resource "google_folder" "SAP" {
    display_name = "SAP"
    parent = google_folder.Financeiro.name
}

resource "google_folder" "Desenvolvimento3" {
    display_name = "Desenvolvimento"
    parent = google_folder.SAP.name
}

resource "google_folder" "Producao3" {
    display_name = "Producao"
    parent = google_folder.SAP.name
}

resource "google_project" "antonucci-sap-dev" {
    name = "antonucci-sap-dev"
    project_id = "antonucci-sap-dev"
    folder_id = google_folder.Desenvolvimento.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}

resource "google_project" "antonucci-sap-prod" {
    name = "antonucci-sap-prod"
    project_id = "antonucci-sap-prod"
    folder_id = google_folder.Producao.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}



// Bloco Back end

resource "google_folder" "BackEnd" {
    display_name = "BackEnd"
    parent = google_folder.Software.name
}

resource "google_folder" "Desenvolvimento2" {
    display_name = "Desenvolvimento"
    parent = google_folder.BackEnd.name
}

resource "google_folder" "Producao2" {
    display_name = "Producao"
    parent = google_folder.BackEnd.name
}

resource "google_project" "antonucci-backend-dev" {
    name = "antonucci-backend-dev"
    project_id = "antonucci-backend-dev"
    folder_id = google_folder.Desenvolvimento.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}

resource "google_project" "antonucci-backend-prod" {
    name = "antonucci-backend-prod"
    project_id = "antonucci-backend-prod"
    folder_id = google_folder.Producao.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}

// Bloco Front end

resource "google_folder" "FrontEnd" {
    display_name = "FrontEnd"
    parent = google_folder.Software.name
}

resource "google_folder" "Desenvolvimento1" {
    display_name = "Desenvolvimento"
    parent = google_folder.FrontEnd.name
}

resource "google_folder" "Producao1" {
    display_name = "Producao"
    parent = google_folder.FrontEnd.name
}

resource "google_project" "antonucci-frontend-dev" {
    name = "antonucci-frontend-dev"
    project_id = "antonucci-frontend-dev"
    folder_id = google_folder.Desenvolvimento.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}

resource "google_project" "antonucci-frontend-prod" {
    name = "antonucci-frontend-prod"
    project_id = "antonucci-frontend-prod"
    folder_id = google_folder.Producao.name
    auto_create_network = false
    billing_account = "01D486-702065-1AE669"

}