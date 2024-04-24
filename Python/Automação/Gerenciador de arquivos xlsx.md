#Python 

```python
import shutil
import pandas as pd
import openyxl
import os
from azure.storage.blob import BlobServiceClient

def copiar_caminho(pasta)
	for nome_arquivo in os.listdir(pasta):
		caminho_arquivo = os.path.join(pasta, nome_arquivo)
		if os.path.isfile(caminho_arquivo):
			return caminho_arquivo

def copiar_arquivo(origem, destino):
	shutil.copy2(origem, destino)

def excluir_linha(origem):
	df = pd.read_excel(origem)
	df = df.drop(df.columns[4], axis=1)
	df.to_excel('excel_origem/dados_excel.xlsx', index=False)

def copiar_dados(arquivo_origem, arquivo_destino, planilha_destino):
	wb_origem = openyxl.load_workbook(arquivo_origem)
	wb_destino = openyxl.load_workbook(arquivo)




```