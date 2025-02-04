# Проверка обновлений
function Check-ForUpdates {
    $currentVersion = "0.1beta" 
    $updateUrl = "https://raw.githubusercontent.com/NotCat40/TheCake/main/versions.json"

    try {
        $response = Invoke-RestMethod -Uri $updateUrl
        $latestVersion = $response.versions[-1].version  # Получаем последнюю версию из массива
        $releaseNotes = $response.versions[-1].releaseNotes

        if ($latestVersion -ne $currentVersion) {
            Write-Host "Доступно обновление до версии: $latestVersion" -ForegroundColor Green
            Write-Host "Примечания к выпуску: $releaseNotes" -ForegroundColor Yellow
        } else {
            Write-Host "Обновлений не обнаружено" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "Ошибка при проверке обновлений: $_" -ForegroundColor Red
    }
}
# Логотип программы
Write-Host @"
████████╗██╗░░██╗███████╗  ░█████╗░░█████╗░██╗░░██╗███████╗
╚══██╔══╝██║░░██║██╔════╝  ██╔══██╗██╔══██╗██║░██╔╝██╔════╝
░░░██║░░░███████║█████╗░░  ██║░░╚═╝███████║█████═╝░█████╗░░
░░░██║░░░██╔══██║██╔══╝░░  ██║░░██╗██╔══██║██╔═██╗░██╔══╝░░
░░░██║░░░██║░░██║███████╗  ╚█████╔╝██║░░██║██║░╚██╗███████╗
░░░╚═╝░░░╚═╝░░╚═╝╚══════╝  ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝
"@ -ForegroundColor Red
Write-Host ""
Write-Host "Версия программы: 0.1beta"
Write-Host "Проверка обновлений..."
Check-ForUpdates
Write-Host "Запуск программы..."
Start-Sleep -Seconds 3

function Show-Menu {
    Clear-Host 
    Write-Host "╔══════════════════════════ ГЛАВНОЕ МЕНЮ ══════════════════════════╗" -ForegroundColor Magenta
    Write-Host "║                                                                 ║" -ForegroundColor Magenta
    Write-Host "║  1. Создать бэкап звуковых схем                                 ║" -ForegroundColor Green
    Write-Host "║  2. Скоро будет!                                                ║" -ForegroundColor DarkGray
    Write-Host "║  3. Скоро будет!                                                ║" -ForegroundColor DarkGray
    Write-Host "║  4. Скоро будет!                                                ║" -ForegroundColor DarkGray
    Write-Host "║  5. Скоро будет!                                                ║" -ForegroundColor DarkGray
    Write-Host "║  6. Скоро будет!                                                ║" -ForegroundColor DarkGray
    Write-Host "║  7. Скоро будет!                                                ║" -ForegroundColor DarkGray
    Write-Host "║  8. Скоро будет!                                                ║" -ForegroundColor DarkGray
    Write-Host "║  9. Скоро будет!                                                ║" -ForegroundColor DarkGray
    Write-Host "║ 10. Скоро будет!                                                ║" -ForegroundColor DarkGray
    Write-Host "║ 11. Выход                                                       ║" -ForegroundColor Red
    Write-Host "║                                                                 ║" -ForegroundColor Magenta
    Write-Host "╚═════════════════════════════════════════════════════════════════╝" -ForegroundColor Magenta
}

function Backup-SoundSchemes {
    # Существующий код для бэкапа
    $registryPath = "HKEY_CURRENT_USER\AppEvents\Schemes"
    $fileName = Read-Host "Введите название файла (без расширения .reg)"
    $outputFile = Join-Path -Path $PSScriptRoot -ChildPath "$fileName.reg"
    
    if (Test-Path "Registry::$registryPath") {
        regedit /e "$outputFile" "$registryPath"
        Write-Host ""
        Write-Host "Бэкап успешно сохранен!" -ForegroundColor Green
        Write-Host "Путь: $outputFile" -ForegroundColor Green
        Write-Host "Помните: Бэкап вашей версии WIndows нормально работает только на конкретной версии Windows" -ForegroundColor Green
        Write-Host ""
    } else {
        Write-Host "`n╔══════════════════════════════════════════════════╗" -ForegroundColor Red
        Write-Host "║ Ошибка: Раздел реестра не найден!                 ║" -ForegroundColor Red
        Write-Host "╚══════════════════════════════════════════════════╝`n" -ForegroundColor Red
    }
    pause
}

do {
    Show-Menu
    $choice = Read-Host "`nВыберите действие (1-11)"
    
    switch ($choice) {
        '1' { Backup-SoundSchemes }
        '2' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
        '3' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
        '4' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
        '5' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
        '6' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
        '7' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
        '8' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
        '9' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
        '10' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
        '11' { Write-Host "`nДо свидания!`n" -ForegroundColor Cyan; exit }
        default { Write-Host "`nНекорректный выбор! Попробуйте снова.`n" -ForegroundColor Red; pause }
    }
} while ($true)
