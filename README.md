# Greed Campus API

### Utilizaremos [Flask](https://flask.palletsprojects.com/en/3.0.x/) para a implementação.

## Informações Importantes:
* Versão do Python: [3.12](https://www.python.org/downloads/)
* Recomendável utilizar Linux para o desenvolvimento do projeto. Se você utiliza windows, recomendo instalar o [WSL](https://learn.microsoft.com/pt-br/windows/wsl/install).
* [Modelo Lógico / Conceitual do BD](https://app.brmodeloweb.com/#!/publicview/66a865c8ffbc074e6c4405fc)
* [Modelo Relacional](https://app.brmodeloweb.com/#!/publicview/66be982558221c2eaf5b53c1) 

## Rodando a API:

### Ambiente Virtual
\
Crie o ambiente virtual:
```
python3.12 -m venv ENV
```
Acesse o ambiente virtual:
```
source ENV/bin/activate
```
Instale as dependências:
```
pip install -r requirements.txt
```

### Configurações de BD
\
Copie o arquivo .env.example e configure suas variáveis de ambiente
```
cp .env.example .env
```
Crie um banco de dados MySQL:
```
mysql -u [user] -p
> CREATE DATABASE [dbname];
```

### Excutando e testando rotas
\
Execute o script:
```
python app.py
```
Popule o banco de dados:
```
mysql> source /path/to/greedcampusapi/db.files/gc-ready.sql
```
Ou simplesmente copie e cole o conteúdo do arquivo **gc-ready.sql** em seu SGDB e execute os scripts.