$global:LogsRoot = Join-Path $PSScriptRoot ""
Add-Type -AssemblyName System.Windows.Forms
function Write-Log {
    param(
        [string]$Message,
        [string]$FunctionName
    )
    
    try {
        if (-not (Test-Path $global:LogsRoot)) {
            New-Item -ItemType Directory -Path $global:LogsRoot -Force | Out-Null
            Write-Log -Message "Создана директория для логов" -FunctionName "System"
        }
        $logFileName = "temp.log"
        $logPath = Join-Path $global:LogsRoot $logFileName
        
        $logEntry = "[$FunctionName] $Message"
        Add-Content -Path $logPath -Value $logEntry -Encoding UTF8
        
    } catch {
        Write-Host "Ошибка записи в лог: $_" -ForegroundColor Red
    }
}

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
        Write-Log -Message "Ошибка при проверке обновлений $_" -FunctionName "CheckUpdates"
    }
}

# Логотип программы
$currentVersion = "0.1beta" 
Write-Host @"
████████╗██╗░░██╗███████╗  ░█████╗░░█████╗░██╗░░██╗███████╗
╚══██╔══╝██║░░██║██╔════╝  ██╔══██╗██╔══██╗██║░██╔╝██╔════╝
░░░██║░░░███████║█████╗░░  ██║░░╚═╝███████║█████═╝░█████╗░░
░░░██║░░░██╔══██║██╔══╝░░  ██║░░██╗██╔══██║██╔═██╗░██╔══╝░░
░░░██║░░░██║░░██║███████╗  ╚█████╔╝██║░░██║██║░╚██╗███████╗
░░░╚═╝░░░╚═╝░░╚═╝╚══════╝  ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝
"@ -ForegroundColor Red
Write-Log -Message "=== ЗАПУСК ПРОГРАММЫ ===" -FunctionName "System"
Write-Log -Message "Текущая версия: $currentVersion" -FunctionName "System"
Write-Host ""
Write-Host "Версия программы: $currentVersion"
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
        Write-Host "║  2. Создать бэкап курсоров                                      ║" -ForegroundColor Green
        Write-Host "║  3. Создать бэкап настроек проводника                           ║" -ForegroundColor Green
        Write-Host "║  4. Скоро будет!                                                ║" -ForegroundColor DarkGray
        Write-Host "║  5. Скоро будет!                                                ║" -ForegroundColor DarkGray
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
    elseif ($menuType -eq "test") {
        Write-Host "╔══════════════════════════ DEBUG МЕНЮ ═══════════════════════════╗" -ForegroundColor Magenta
        Write-Host "║                                                                 ║" -ForegroundColor Magenta
        Write-Host "║ 97. Debug dialog windows                                        ║" -ForegroundColor Green
        Write-Host "║ 98. Test                                                        ║" -ForegroundColor DarkGray
        Write-Host "║ 99. Exit (new version)                                          ║" -ForegroundColor Red
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

function Backup-ExplorerSettings {
    $registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    $fileName = Read-Host "Введите название файла (без расширения .reg)"
    $backupDir = Join-Path $PSScriptRoot "backups\explorer"
    
    # Создаем папку для бэкапа
    if (-not (Test-Path $backupDir)) { 
        New-Item -Path $backupDir -ItemType Directory -Force | Out-Null 
    }

    # Исправлено: Добавлено полное имя файла для экспорта
    $outputFile = Join-Path $backupDir "$fileName.reg"
    
    # Исправлено: Подавлен вывод успешного сообщения
    reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" $outputFile /y > $null

    # Показываем текущие настройки
    $settings = Get-ItemProperty -Path $registryPath
    Write-Host "`nТекущие настройки проводника:" -ForegroundColor Cyan
    Write-Host "──────────────────────────────"
    Write-Host "Скрытые файлы:          " -NoNewline
    Write-Host $(if ($settings.Hidden -eq 1) { "Показаны" } else { "Скрыты" }) -ForegroundColor $(if ($settings.Hidden -eq 1) { "Green" } else { "Red" })
    
    Write-Host "Расширения файлов:      " -NoNewline
    Write-Host $(if ($settings.HideFileExt -eq 0) { "Показаны" } else { "Скрыты" }) -ForegroundColor $(if ($settings.HideFileExt -eq 0) { "Green" } else { "Red" })
    
    Write-Host "Системные файлы:        " -NoNewline
    Write-Host $(if ($settings.ShowSuperHidden -eq 0) { "Скрыты" } else { "Показаны" }) -ForegroundColor $(if ($settings.ShowSuperHidden -eq 1) { "Green" } else { "Red" })
    
    Write-Host "`nБэкап настроек экспортирован: $outputFile" -ForegroundColor Green
    Write-Host "Для восстановления просто запустите файл .reg" -ForegroundColor Yellow
    Write-Log -Message "Бэкап успешно сохранен в директорию $outputFile" -FunctionName "Backup Explorer Settings"
    pause
}

function Backup-SoundSchemes {
    $registryPath = "HKEY_CURRENT_USER\AppEvents\Schemes"
    $fileName = Read-Host "Введите название файла (без расширения .reg)"
    $backupDir = Join-Path -Path $PSScriptRoot -ChildPath "backups\personalization"
    
    # Создаем папку, если её нет
    if (-not (Test-Path -Path $backupDir)) {
        New-Item -Path $backupDir -ItemType Directory -Force | Out-Null
        Write-Log -Message "Папка создана..." -FunctionName "Backup Sound Schemes"
    }
    
    $outputFile = Join-Path -Path $backupDir -ChildPath "$fileName.reg"
    
    if (Test-Path "Registry::$registryPath") {
        regedit /e "$outputFile" "$registryPath"
        Write-Host ""
        Write-Host "Бэкап звуковых схем успешно сохранен!" -ForegroundColor Green
        Write-Host "Путь: $outputFile" -ForegroundColor Green
        Write-Host "Помните: Бэкап вашей версии Windows может не работать на других версиях" -ForegroundColor Green
        Write-Host ""
        Write-Log -Message "Бэкап успешно сохранен в директорию $outputFile" -FunctionName "Backup Sound Schemes"
    } else {
        Write-Host "Ошибка реестра"
        Write-Log -Message "Ошибка реестра, раздел реестра не найден!" -FunctionName "Backup Sound Schemes"
    }
    pause
}

function Backup-Cursors {
    $registryPath = "HKEY_CURRENT_USER\Control Panel\Cursors"
    $fileName = Read-Host "Введите название файла (без расширения .reg)"
    $backupDir = Join-Path -Path $PSScriptRoot -ChildPath "backups\personalization"
    
    # Создаем папку, если её нет
    if (-not (Test-Path -Path $backupDir)) {
        New-Item -Path $backupDir -ItemType Directory -Force | Out-Null
        Write-Log -Message "Папка создана..." -FunctionName "Backup Cursors"
    }
    
    $outputFile = Join-Path -Path $backupDir -ChildPath "$fileName.reg"
    
    if (Test-Path "Registry::$registryPath") {
        regedit /e "$outputFile" "$registryPath"
        Write-Host ""
        Write-Host "Бэкап курсоров успешно сохранен!" -ForegroundColor Green
        Write-Host "Путь: $outputFile" -ForegroundColor Green
        Write-Host "Помните: Бэкап вашей версии Windows может не работать на других версиях" -ForegroundColor Green
        Write-Host ""
        Write-Log -Message "Бэкап успешно сохранен в директорию $outputFile" -FunctionName "Backup Cursors"
    } else {
        Write-Host "Ошибка реестра!" -ForegroundColor Red
        Write-Log -Message "Ошибка реестра, раздел реестра не найден!" -FunctionName "Backup Cursors"
    }
    pause
}

function Test-Function {
    $message = "Тестовая функция, Выберите Да, Нет или Отмена"
    $title = "Тест"

    $result = [System.Windows.Forms.MessageBox]::Show($message, $title, [System.Windows.Forms.MessageBoxButtons]::YesNoCancel, [System.Windows.Forms.MessageBoxIcon]::Information)

    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        Write-Host "Вы выбрали Да."
    } elseif ($result -eq [System.Windows.Forms.DialogResult]::No) {
        Write-Host "Вы выбрали Нет."
    } elseif ($result -eq [System.Windows.Forms.DialogResult]::Cancel) {
        Write-Host "Вы выбрали Отмена."
    }

    pause
}


function Exit-Programm {
    Write-Host "`nДо свидания!`n" -ForegroundColor Cyan;
    Write-Log -Message "=== ЗАВЕРШЕНИЕ РАБОТЫ ===" -FunctionName "System"
    exit
    }

function Exit-New {
    $message = "Вы точно хотите выйти?"
    $title = "The Cake - Выход"

    $result = [System.Windows.Forms.MessageBox]::Show($message, $title, [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)

    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) 
    {
    Write-Host "`nДо свидания!`n" -ForegroundColor Cyan;
    Write-Log -Message "=== ЗАВЕРШЕНИЕ РАБОТЫ ===" -FunctionName "System"
    exit
    } 
    elseif ($result -eq [System.Windows.Forms.DialogResult]::No) 
    {
    }
    }

$currentMenu = "main"

do {
    if ($currentMenu -eq "main") {
        Show-Menu -menuType "main"
        $choice = Read-Host "`nВыберите действие (1-11)"
        
        switch ($choice) {
            '1' { Backup-SoundSchemes }
            '2' { Backup-Cursors }
            '3' { Backup-ExplorerSettings }
            '4' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '5' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '6' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '7' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '8' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '9' { Show-Git }
            '10' { $currentMenu = "second" }
            '11' { Exit-Programm }
            '999' { $currentMenu = "test" }
            default { Write-Host "`nНекорректный выбор! Попробуйте снова.`n" -ForegroundColor Red; pause }
        }
    }
    elseif ($currentMenu -eq "second") {
        Show-Menu -menuType "second"
        $choice = Read-Host "`nВыберите действие (12-22)"
        
        switch ($choice) {
            '12' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '13' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '14' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '15' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '16' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '17' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '18' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '19' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '20' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '21' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '22' { $currentMenu = "main" }  # Возврат в главное меню
            default { Write-Host "`nНекорректный выбор! Попробуйте снова.`n" -ForegroundColor Red; pause }
        }
    }
    elseif ($currentMenu -eq "test") {
        Show-Menu -menuType "test" 
        $choice = Read-Host "`nВыберите действие (97-99)"
        
        switch ($choice) {
            '97' { Test-Function }
            '98' { Write-Host "Скоро будет..." -ForegroundColor DarkGray; pause }
            '99' { Exit-New }
            default { Write-Host "`nНекорректный выбор! Попробуйте снова.`n" -ForegroundColor Red; pause }
        }
    }
}
while ($true)
