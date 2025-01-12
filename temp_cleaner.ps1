# Limpeza de arquivos temporários e execução da Limpeza de Disco
Write-Host "Iniciando a limpeza de arquivos temporarios e disco..." -ForegroundColor Green

# Função para limpar arquivos temporários com base em extensão a ser ignorada
function Limpar-Temp {
    param(
        [string]$path,
        [string]$ignorarExtensao
    )
    Write-Host "Limpando arquivos em $path, ignorando *$ignorarExtensao ..." -ForegroundColor Cyan

    # Verificar se a pasta existe
    if (Test-Path $path) {
        # Pegar todos os arquivos e pastas
        Get-ChildItem -Path $path -Recurse -Force | ForEach-Object {
            try {
                # Ignorar arquivos com a extensão especificada
                if ($_.Extension -ne $ignorarExtensao) {
                    if ($_.PSIsContainer) {
                        # Remover pastas
                        Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue
                    } else {
                        # Remover arquivos
                        Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue
                    }
                } else {
                    Write-Host "Ignorando arquivo: $($_.FullName)" -ForegroundColor Yellow
                }
            } catch {
                Write-Host "Erro ao remover: $_" -ForegroundColor Red
            }
        }
        Write-Host "Limpeza em $path concluída." -ForegroundColor Green
    } else {
        Write-Host "Pasta $path não encontrada." -ForegroundColor Red
    }
}

# Limpar %Temp% do usuário atual, ignorando arquivos .tmp
Limpar-Temp "$env:TEMP" ".tmp"

# Limpar a pasta Temp no diretório do Windows, ignorando arquivos .log
Limpar-Temp "C:\Windows\Temp" ".log"

# Executar a Limpeza de Disco
Write-Host "Executando Limpeza de Disco..." -ForegroundColor Cyan
Start-Process -FilePath "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait

Write-Host "Processo concluído!" -ForegroundColor Green
