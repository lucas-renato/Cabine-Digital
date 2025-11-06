workspace "Cabine Digital UFMS" "Modelagem C4 - Contexto, Containers e Implantação" {

    model {
        // --- Atores externos ---
        participante = person "Participante" "Participante que usa o app mobile."
        organizador = person "Organizador de Evento" "Gerencia eventos e molduras via web."
        administrador = person "Administrador" "Gerencia organizadores e configurações do sistema."

        email_service = softwareSystem "Serviço de Email" "Envia fotos aos participantes."
        social_media = softwareSystem "Redes Sociais" "Permite compartilhamento de fotos."

        // --- Sistema principal ---
        cabine_digital = softwareSystem "Cabine Digital UFMS" "Sistema de fotos e coleta de informações em eventos." {
            web_app = container "Aplicação Web" "Permite que organizadores e administrador criem/gerenciem eventos e molduras." "React + Web"
            mobile_app = container "Aplicação Mobile" "Permite que participantes tirem fotos e preencham formulário." "Flutter / iOS / Android"
            api_backend = container "API Backend" "Gerencia lógica do sistema e comunicação com banco de dados." "Node.js / Spring Boot"
            db = container "Banco de Dados" "Armazena eventos, participantes e fotos." "PostgreSQL"
        }

        // --- Relacionamentos de contexto ---
        participante -> cabine_digital "Usa o sistema para tirar fotos e preencher questionário"
        organizador -> cabine_digital "Gerencia eventos e molduras"
        administrador -> cabine_digital "Administra o sistema e usuários"
        cabine_digital -> email_service "Envia fotos aos participantes"
        cabine_digital -> social_media "Compartilha fotos"

        // --- Relacionamentos de containers ---
        participante -> mobile_app "Usa o app mobile para tirar fotos e preencher questionário"
        organizador -> web_app "Usa o app web para criar e gerenciar eventos"
        administrador -> web_app "Usa o app web para gerenciar organizadores e configurações"
        web_app -> api_backend "Faz requisições via API"
        mobile_app -> api_backend "Envia fotos e dados via API"
        api_backend -> db "Lê e grava dados"
        api_backend -> email_service "Envia emails com fotos"
        api_backend -> social_media "Compartilha fotos nas redes"

        // --- Ambiente de implantação ---
        deploymentEnvironment "Produção" {
            deploymentNode "Servidor Agetic - UFMS" "Servidor físico hospedado na Agetic (mesmo do Passaporte UFMS)" "Linux / Docker" {
                containerInstance api_backend
                containerInstance db
            }

            deploymentNode "Dispositivo do Usuário" "Celular Android/iOS" "Flutter App" {
                containerInstance mobile_app
            }

            deploymentNode "Navegador Web" "Google Chrome / Firefox" "Browser" {
                containerInstance web_app
            }
        }
    }

    views {
        // --- Diagrama de Contexto ---
        systemContext cabine_digital "cabine_digital_context" "Diagrama de Contexto - Cabine Digital UFMS" {
            include *
            autolayout lr
        }

        // --- Diagrama de Containers ---
        container cabine_digital "cabine_digital_container" "Diagrama de Containers - Cabine Digital UFMS" {
            include *
            autolayout lr
        }

        // --- Diagrama de Implantação ---
        deployment cabine_digital "Produção" "cabine_digital_deployment" "Diagrama de Implantação - Cabine Digital UFMS" {
            include *
            autolayout lr
        }

        theme default
    }
}
