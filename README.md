# DevOps Rest API Nest

Este repositório apresenta um **boilerplate do NestJS**, desenvolvido com o propósito de revisar e aplicar conhecimentos sobre o uso de **Docker** em aplicações backend. Ele é uma base sólida para novos projetos, permitindo a configuração rápida e eficiente de um ambiente de desenvolvimento.

---

## 🎯 Objetivo

Este boilerplate foi desenvolvido como parte de um estudo contínuo de práticas de **DevOps** e **conteneirização**, proporcionando um ambiente de desenvolvimento rápido, portátil e consistente.

---

## 🛠️ Tecnologias Utilizadas

- **NestJS:** Framework para construção de APIs eficientes e escaláveis.
- **Docker:** Ferramenta para criação e gerenciamento de containers.
- **Node.js:** Ambiente de execução para JavaScript.

---

## 📂 Estrutura do Projeto

O projeto utiliza um **Dockerfile** otimizado para Node.js, garantindo que o ambiente do container seja leve e eficiente. Além disso, conta com um arquivo `.dockerignore` para evitar que arquivos desnecessários sejam incluídos na imagem final.

### 📄 Dockerfile

```dockerfile
FROM node:20.14-slim

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm i

COPY . .

RUN npm run build

EXPOSE 3000

CMD [ "npm", "run", "start" ]
```

## 🛠️ Explicação do Dockerfile

- Imagem Base: Utiliza a versão slim do Node.js 20.14 para garantir leveza.
- Diretório de Trabalho: Define /usr/src/app como o diretório principal do container.
- Cópia do Código-Fonte: Adiciona todos os arquivos do projeto ao container.
- Build da Aplicação: Roda o comando npm run build para compilar o código.
- Exposição de Porta: Expõe a porta 3000 para acesso externo.
- Comando de Inicialização: Utiliza npm run start para iniciar a aplicação
- Instalação de Dependências: Copia os arquivos package.json e package-lock.json (se existir) para o container e executa npm install.

### 📄 .dockerignore

```dockerignore
node_modules
dist
Dockerfile
.git
.dockerignore
.gitignore
```

## 🛠️ Explicação do .dockerignore

- node_modules: Exclui as dependências instaladas localmente para evitar redundância no container.
- dist: Evita incluir arquivos de build locais no contexto de criação da imagem.
- Arquivos de Configuração: Ignora arquivos como .git, .gitignore e o próprio Dockerfile para manter a imagem enxuta.
