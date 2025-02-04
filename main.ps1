# Проверка обновлений
function Check-ForUpdates {
    $currentVersion = "0.2beta" 
    $updateUrl = "https://raw.githubusercontent.com/NotCat40/TheCake/main/versions.json"

    try {
        $response = Invoke-RestMethod -Uri $updateUrl
        $latestVersion = $response.versions[-1].version
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
    param($menuType = "main")
    
    Clear-Host 
    if ($menuType -eq "main") {
        Write-Host "╔══════════════════════════ ГЛАВНОЕ МЕНЮ ══════════════════════════╗" -ForegroundColor Magenta
        Write-Host "║                                                                 ║" -ForegroundColor Magenta
        Write-Host "║  1. Создать бэкап звуковых схем                                 ║" -ForegroundColor Green
        Write-Host "║  2. Докс по секс айди                                           ║" -ForegroundColor Green
        Write-Host "║  3. ДДОС СВОЕГО АЙПИ                                            ║" -ForegroundColor Green
        Write-Host "║  4. Купить ведро дурову симулятор                               ║" -ForegroundColor Green
        Write-Host "║  5. Купить ФПИ БАНКИ                                            ║" -ForegroundColor Green
        Write-Host "║  6. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║  7. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║  8. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║  9. Репозиторий                                                 ║" -ForegroundColor Green
        Write-Host "║ 10. Вторая страница меню                                        ║" -ForegroundColor Yellow
        Write-Host "║ 11. Выход                                                       ║" -ForegroundColor Red
        Write-Host "║                                                                 ║" -ForegroundColor Magenta
        Write-Host "╚═════════════════════════════════════════════════════════════════╝" -ForegroundColor Magenta
    }
    elseif ($menuType -eq "second") {
        Write-Host "╔══════════════════════════ ВТОРОЕ МЕНЮ ═══════════════════════════╗" -ForegroundColor Magenta
        Write-Host "║                                                                 ║" -ForegroundColor Magenta
        Write-Host "║ 12. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║ 13. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║ 14. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║ 15. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║ 16. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║ 17. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║ 18. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║ 19. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║ 20. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║ 21. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║ 22. Вернуться в главное меню                                    ║" -ForegroundColor Yellow
        Write-Host "║                                                                 ║" -ForegroundColor Magenta
        Write-Host "╚═════════════════════════════════════════════════════════════════╝" -ForegroundColor Magenta
    }
}

function Show-Git {
    Write-Host "" -ForegroundColor Yellow 
    Write-Host "Ссылка на репозиторий: https://github.com/NotCat40/TheCake" -ForegroundColor Yellow 
    Write-Host "" -ForegroundColor Yellow 
    pause
}

function Backup-SoundSchemes {
    $registryPath = "HKEY_CURRENT_USER\AppEvents\Schemes"
    $fileName = Read-Host "Введите название файла (без расширения .reg)"
    $outputFile = Join-Path -Path $PSScriptRoot -ChildPath "$fileName.reg"
    
    if (Test-Path "Registry::$registryPath") {
        regedit /e "$outputFile" "$registryPath"
        Write-Host ""
        Write-Host "Бэкап успешно сохранен!" -ForegroundColor Green
        Write-Host "Путь: $outputFile" -ForegroundColor Green
        Write-Host "Помните: Бэкап вашей версии Windows нормально работает только на конкретной версии Windows" -ForegroundColor Green
        Write-Host ""
    } else {
        Write-Host "`n╔══════════════════════════════════════════════════╗" -ForegroundColor Red
        Write-Host "║ Ошибка: Раздел реестра не найден!                 ║" -ForegroundColor Red
        Write-Host "╚══════════════════════════════════════════════════╝`n" -ForegroundColor Red
    }
    pause
}

function Run-TestScript {
    $scriptPath = Join-Path -Path "$PSScriptRoot\XCoder" -ChildPath "Main.py"
    
    if (Test-Path $scriptPath) {
        Write-Host "Запуск..." -ForegroundColor Green
        Start-Process -FilePath "python" -ArgumentList $scriptPath -NoNewWindow -Wait
        Write-Host "Программа завершенена!" -ForegroundColor Green
    } else {
        Write-Host "Ошибка: Файл test.py не найден!" -ForegroundColor Red
    }
    pause
}

function Run-DurovGame {
    $scriptPath = Join-Path -Path "$PSScriptRoot\scripts" -ChildPath "durovvedrosimulator.py"
    
    if (Test-Path $scriptPath) {
        Write-Host "Запуск..." -ForegroundColor Green
        Start-Process -FilePath "python" -ArgumentList $scriptPath -NoNewWindow -Wait
        Write-Host "Программа завершенена!" -ForegroundColor Green
    } else {
        Write-Host "Ошибка: Файл durovvedrosimulator.py не найден!" -ForegroundColor Red
    }
    pause
}

function Run-DDosLocalHost {
    $scriptPath = Join-Path -Path "$PSScriptRoot\scripts" -ChildPath "ddos.py"
    
    if (Test-Path $scriptPath) {
        Write-Host "Запуск..." -ForegroundColor Green
        Start-Process -FilePath "python" -ArgumentList $scriptPath -NoNewWindow -Wait
        Write-Host "Программа завершенена!" -ForegroundColor Green
    } else {
        Write-Host "Ошибка: Файл ddos.py не найден!" -ForegroundColor Red
    }
    pause
}

function Run-CryptoBuy {
    $scriptPath = Join-Path -Path "$PSScriptRoot\scripts" -ChildPath "fpi.py"
    
    if (Test-Path $scriptPath) {
        Write-Host "Запуск..." -ForegroundColor Green
        Start-Process -FilePath "python" -ArgumentList $scriptPath -NoNewWindow -Wait
        Write-Host "Программа завершенена!" -ForegroundColor Green
    } else {
        Write-Host "Ошибка: Файл fpi.py не найден!" -ForegroundColor Red
    }
    pause
}

$currentMenu = "main"

do {
    if ($currentMenu -eq "main") {
        Show-Menu -menuType "main"
        $choice = Read-Host "`nВыберите действие (1-11)"
        
        switch ($choice) {
            '1' { Backup-SoundSchemes }
            '2' { Run-TestScript }
            '3' { Run-DDosLocalHost }
            '4' { Run-DurovGame }
            '5' { Run-CryptoBuy }
            '6' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
            '7' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
            '8' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
            '9' { Show-Git }
            '10' { $currentMenu = "second" }
            '11' { Write-Host "`nДо свидания!`n" -ForegroundColor Cyan; exit }
            default { Write-Host "`nНекорректный выбор! Попробуйте снова.`n" -ForegroundColor Red; pause }
        }
    }
    elseif ($currentMenu -eq "second") {
        Show-Menu -menuType "second"
        $choice = Read-Host "`nВыберите действие (12-22)"
        
        switch ($choice) {
            '12' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
            '13' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
            '14' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
            '15' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
            '16' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
            '17' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
            '18' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
            '19' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
            '20' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
            '21' { Write-Host "`n$(Get-Date -Format '[HH:mm:ss]') Скоро будет...`n" -ForegroundColor Yellow; pause }
            '22' { $currentMenu = "main" }
            default { Write-Host "`nНекорректный выбор! Попробуйте снова.`n" -ForegroundColor Red; pause }
        }
    }
}
while ($true)
