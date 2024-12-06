import psycopg2
from psycopg2 import sql

class MultisportDB:
    def __init__(self, host, database, user, password, port):
        self.host = host
        self.database = database
        self.user = user
        self.password = password
        self.port = port
        self.conn = None
        

    def connect(self):
        try:
            self.conn = psycopg2.connect(
                host=self.host,
                database=self.database,
                user=self.user,
                password=self.password,
                port=self.port
            )
            print("Conexão com o banco de dados estabelecida com sucesso!")
        except psycopg2.Error as e:
            print(f"Erro ao conectar ao banco de dados: {e}")
            exit()

    def close(self):
        if self.conn:
            self.conn.close()
            print("Conexão com o banco de dados encerrada.")

    def execute_query(self, query, params=None, fetch=False):
        try:
            with self.conn.cursor() as cur:
                cur.execute(query, params)
                if fetch:
                    return cur.fetchall()
                self.conn.commit()
        except psycopg2.Error as e:
            print(f"Erro ao executar query: {e}")
            self.conn.rollback()
            return None


class MultisportApp:
    def __init__(self, db):
        self.db = db

    def cadastrar_usuario(self):
        print("\nCadastro de Usuário:")
        email = input("Digite o e-mail: ")
        nome = input("Digite o nome: ")
        data_nascimento = input("Digite a data de nascimento (YYYY-MM-DD): ")
        tipo_conta = input("Digite o tipo de conta (comum/premium/admin): ")

        query = """
        INSERT INTO Usuario (email, nome, data_nascimento, tipo_conta)
        VALUES (%s, %s, %s, %s);
        """
        params = (email, nome, data_nascimento, tipo_conta)
        self.db.execute_query(query, params)
        print("Usuário cadastrado com sucesso!")

    def consultar_transmissoes_por_esporte(self):
        print("\nConsulta de Transmissões por Esporte:")
        esporte = input("Digite o nome do esporte: ")

        query = """
        SELECT numero_transmissao, horario_inicio, duracao, qualidade
        FROM Transmissao
        WHERE nome_esporte = %s;
        """
        params = (esporte,)
        results = self.db.execute_query(query, params, fetch=True)
        if results:
            print("\nTransmissões encontradas:")
            for t in results:
                print(f"Transmissão: {t[0]}, Início: {t[1]}, Duração: {t[2]} min, Qualidade: {t[3]}")
        else:
            print("Nenhuma transmissão encontrada para o esporte informado.")

    def menu(self):
        while True:
            print("\nMenu Principal:")
            print("1. Cadastrar Usuário")
            print("2. Consultar Transmissões por Esporte")
            print("3. Sair")
            opcao = input("Escolha uma opção: ")

            if opcao == "1":
                self.cadastrar_usuario()
            elif opcao == "2":
                self.consultar_transmissoes_por_esporte()
            elif opcao == "3":
                print("Encerrando aplicação...")
                break
            else:
                print("Opção inválida! Tente novamente.")


if __name__ == "__main__":
    # Configurações do banco de dados
    db_config = {
        "host": "localhost",
        "database": "multisport",
        "user": "postgres",
        "password": "12345",
        "port" : "12345"
    }

    # Instância do banco e conexão
    db = MultisportDB(**db_config)
    db.connect()

    # Instância da aplicação e menu principal
    app = MultisportApp(db)
    try:
        app.menu()
    finally:
        db.close()
