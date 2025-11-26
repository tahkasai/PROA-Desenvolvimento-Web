# Spring Boot
O **Spring Boot** é um framework que facilita muito a criação de aplicações em Java. Antes dele, desenvolver usando Spring exigia muitas configurações manuais e arquivos complicados. O Spring Boot veio para simplificar isso.

Com ele, é possível criar uma aplicação completa com muito menos esforço.

### Em resumo, o Spring Boot:
* evita configurações manuais  
* permite rodar a aplicação sem instalar servidor externo  
* traz recursos prontos para APIs e sistemas web  
* acelera o desenvolvimento  
* organiza dependências automaticamente  

##  Principais características do Spring Boot
1. **Simplicidade**: Antes era necessário configurar quase tudo na mão, com o Spring Boot, isso já vem pronto.
2. **Configuração automática**: O framework identifica o que você está usando e se ajusta sozinho.
3. **Servidor embutido**: Você não precisa instalar Tomcat ou outro servidor, a aplicação roda direto com um clique.
4. **Starters (pacotes prontos)**: São conjuntos de dependências que facilitam adicionar funcionalidades sem preocupações com versões.
Exemplo: spring-boot-starter-web
já traz tudo o que é necessário para criar APIs
5. **Produtividade**: Menos tempo configurando, mais tempo desenvolvendo.
6. **Recursos prontos para produção**: Como:
   * monitoramento
   * saúde da aplicação
   * configurações externas
7. **Aplicações independentes**: Você gera um arquivo `.jar` e executa como um programa normal.

## Como o Spring Boot funciona
* Ponto de entrada: A aplicação inicia a partir de uma classe principal com a anotação `@SpringBootApplication`.
* Anotações: O framework utiliza anotações para entender a função de cada classe, como `@Component`(Componente geral), `@Service`(Regras de Negócio) ou `@Repository`(Acesso ao banco de dados).
* Gerenciamento de dependências: Arquivos como `pom.xml` (para Maven) ou `build.gradle` (para Gradle) gerenciam as dependências. A adição do "parent" do Spring Boot ao `pom.xml`, por exemplo, já disponibiliza as dependências do projeto com versões compatíveis.
* Configuração: Arquivos como application.properties são usados para armazenar configurações, como credenciais de banco de dados. 

## Como Baixar
A forma mais rápida é pelo
<a href="https://start.spring.io">Spring Initializr</a>

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

**3. MS SQL Server Driver**
Driver JDBC necessário para conectar a aplicação ao banco de dados:

- Microsoft SQL Server (local)
- Azure SQL Database

Exemplo de URL: `jdbc:sqlserver://localhost:1433;databaseName=sua_base`

**4. Spring Data JPA**
Fornece integração com o JPA e Hibernate, permitindo manipulação de dados de forma simples por meio de repositórios.

Recursos:
- Mapeamento de entidades com `@Entity`(Entidades)
- Criação automática de tabelas (com configurações apropriadas)
- `JpaRepository` para CRUD sem SQL manual

**5.  Lombok**
Biblioteca para eliminar código repetitivo através de anotações como:

- `@Getter` e `@Setter`
- `@AllArgsConstructor` e `@NoArgsConstructor`
- `@Builder`
- `@ToString`

## Configuração do Banco de Dados

Exemplo para `application.properties`:

``` properties
spring.datasource.url=jdbc:sqlserver://localhost:1433;databaseName=nome_do_banco
spring.datasource.username=seu_usuario
spring.datasource.password=sua_senha
spring.datasource.driver-class-name=com.microsoft.sqlserver.jdbc.SQLServerDriver
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
```


O que significam as configurações principais:
* **ddl-auto=update**: Cria e atualiza tabelas automaticamente
* **show-sql=true**: Mostra no console os comandos SQL executados
* **format-sql=true**:	Deixa o SQL organizado e legível
