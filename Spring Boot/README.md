# Spring Boot
Spring Boot é um framework Java que simplifica a criação de aplicações, eliminando a necessidade de configurações complexas. Ele permite que as aplicações sejam executadas diretamente com servidores web embarcados, como o Tomcat, e facilita o gerenciamento de dependências através de "starters". O objetivo é agilizar o desenvolvimento, aumentando a produtividade, e já incluir recursos prontos para produção, como métricas e health checks. 

---

## Principais características
* Simplicidade: Elimina a necessidade de configurações manuais e extensas em arquivos XML.
* Configuração automática: O framework configura automaticamente o Spring e bibliotecas de terceiros quando possível.
* Servidor embarcado: Permite empacotar a aplicação em um arquivo JAR executável, que pode conter um servidor web embarcado (como Tomcat, Jetty ou Undertow).
* "Starters": Dependências "opinioned" que simplificam a configuração do build, permitindo que o desenvolvedor foque na lógica da aplicação.
* Produtividade: Reduz o tempo de desenvolvimento, pois automatiza tarefas repetitivas e configuradas previamente.
* Recursos para produção: Inclui funcionalidades como métricas, health checks e configuração externa pronta para uso.
* Aplicações stand-alone: Possibilita a criação de aplicações que rodam de forma independente, sem a necessidade de um servidor externo. 

---

## Como o Spring Boot funciona
* Ponto de entrada: A aplicação inicia a partir de uma classe principal com a anotação `@SpringBootApplication`.
* Anotações: O framework utiliza anotações para entender a função de cada classe, como `@Component`, `@Service` ou `@Repository`.
* Gerenciamento de dependências: Arquivos como `pom.xml` (para Maven) ou `build.gradle` (para Gradle) gerenciam as dependências. A adição do "parent" do Spring Boot ao `pom.xml`, por exemplo, já disponibiliza as dependências do projeto com versões compatíveis.
* Configuração: Arquivos como application.properties são usados para armazenar configurações, como credenciais de banco de dados. 

---

## Como Baixar
Para criar um arquivo spring boot de forma rápida, baixe o aquivo aqui:
<a href="https://start.spring.io" color="green">Spring Initializr</a>

### Sugestão de dependências
**1. Spring Web**
Responsável por permitir a criação de aplicações web e APIs REST utilizando o Spring MVC.

Inclui:
- Controllers com `@RestController`
- Rotas com `@GetMapping`, `@PostMapping`, etc.
- Servidor embutido **Tomcat**

**2. Spring Boot DevTools**
Facilita o desenvolvimento oferecendo:

- Reinicialização automática da aplicação ao salvar arquivos
- LiveReload para atualização visual
- Configurações otimizadas para ambiente de desenvolvimento

**3. ✅ MS SQL Server Driver**
Driver JDBC necessário para conectar a aplicação ao banco de dados:

- Microsoft SQL Server (local)
- Azure SQL Database

Exemplo de URL: `jdbc:sqlserver://localhost:1433;databaseName=sua_base`

**4. ✅ Spring Data JPA**
Fornece integração com o JPA e Hibernate, permitindo manipulação de dados de forma simples por meio de repositórios.

Recursos:
- Mapeamento de entidades com `@Entity`
- Criação automática de tabelas (com configurações apropriadas)
- `JpaRepository` para CRUD sem SQL manual

**5. ✅ Lombok**
Biblioteca para eliminar código repetitivo através de anotações como:

- `@Getter` e `@Setter`
- `@AllArgsConstructor` e `@NoArgsConstructor`
- `@Builder`
- `@ToString`

## 🗄️ Configuração do Banco de Dados

Exemplo para `application.properties`:

```properties
spring.datasource.url=jdbc:sqlserver://localhost:1433;databaseName=nome_do_banco
spring.datasource.username=seu_usuario
spring.datasource.password=sua_senha
spring.datasource.driver-class-name=com.microsoft.sqlserver.jdbc.SQLServerDriver

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true```

