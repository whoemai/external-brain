import shutil
import pandas as pd
import openyxl
import os
from azure.storage.blob import BlobServiceClient

def copiar_caminho(pasta):
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
	wb_destino = openyxl.load_workbook(arquivo_destino)
	planilha_origem = wb_origem.worksheets[0]
	planilha_dest = wb_destino[planilha_destino]
	for i, row in enumerate(planilha_origem.iter_rows(values_only=True), start=1)
		for j, value in enumerate(row, start=1):
			planilha_dest.cell(row=i, column=j, value=value)

caminho = copiar_caminho('excel_origem_dados')
excluir_linha(caminho)
copiar_arquivo('excel_origem/template.xlsx', 'excel_origem/pedro_excel.slsx')
copiar_dados('excel_origem/dados_excel.xlsx', 'excel_origem/pedro_excel', 'base_banco')

def get_blob_service_client_sas(self, sds_token: str):
	accout_url = ''
	credential = ''
	blob_service_client = BlobServiceClient(account_url, credential=credential)
	return blob_service_client
