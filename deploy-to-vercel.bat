@echo off
chcp 65001 >nul
echo ========================================
echo   LINE 貼圖工具 → Vercel 部署腳本
echo ========================================
echo.

cd /d "%~dp0"
echo 目前目錄: %cd%
echo.

where node >nul 2>&1
if errorlevel 1 (
  echo [錯誤] 找不到 Node.js，請先安裝 Node.js
  pause
  exit /b 1
)

echo [1/3] 正在檢查/安裝 Vercel CLI...
call npx vercel --version >nul 2>&1
echo [OK] Vercel CLI 已就緒
echo.

echo [2/3] 開始部署到 Vercel...
echo （若是第一次執行，會要求你登入 Vercel 帳號）
echo.
call npx vercel --prod

echo.
echo [3/3] 部署完成！
echo 你的網站網址已顯示在上方。
echo.
pause
