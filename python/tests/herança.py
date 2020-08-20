
# Classe criar funcionario comum
class Funcionario():
  def __init__(self, nome, salario):
    self.nome = nome
    self.salario = salario
  # função de visualização de dados
  def dados(self):
    return {'nome': self.nome, 'salario': self.salario}
# Criando funcionario
c5264 = Funcionario('Gusta',7000)
# mostrando funcionario criado
print(c5264.dados())

# Classe de criar funcionario admin
class Admin(Funcionario):
  def __init__(self, nome, salario):
    super().__init__(nome, salario)
  # função de atualizar dados
  def atualizar_dados(self, nome):
    self.nome = nome
    return self.dados
# criando usuario admin
admin = Admin('Root', 9000)
# mostrando admin criado
print(admin.dados())
# admin atualizando o proprio nome
admin.atualizar_dados('Rootizinho')
# mostrando o admin
print(admin.dados())

