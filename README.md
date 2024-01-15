# Guia de Instalação e Uso do Magento 2 com Docker

Este repositório contém um projeto Magento 2 configurado para ser executado em um ambiente Docker, facilitando o desenvolvimento e teste no Ubuntu.

## Índice

- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Uso Básico](#uso-básico)

## Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- Ubuntu (versão recomendada: 20.04.1)
- Docker (versão mínima requerida: 24.0.7)
- Plugin Docker Compose, para Docker

## Instalação

Siga os passos abaixo:

```bash
# Clone o repositório
git clone git@github.com:00F100/magento2-php8-producthome.git

# Navegue até o diretório do projeto
cd magento2-php8-producthome

# Execute o script de migration do banco de dados
bin/host/migrate

# Executar servidor HTTP usando o diretório "magento2-ce" como raiz
bin/host/develop
```

Após acesse:

- Loja: [http://magento2.docker/](http://magento2.docker/)
- Admin: [http://magento2.docker/admin](http://magento2.docker/admin)
    - Usuário: admin
    - Senha: admin123@A

## Uso Básico

```bash
# Abrir um Terminal com PHP
bin/host/client

# Finaliza os containers e apaga o banco de dados
bin/host/clean

# Cria uma nova cópia do magento na pasta "magento-ce"
bin/host/create

# Executa o processo de setup do Magento
bin/host/setup
```
