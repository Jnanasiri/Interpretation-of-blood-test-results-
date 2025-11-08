@echo off
echo ====================================
echo Blood Report Management System
echo Starting Backend and Frontend...
echo ====================================
echo.

REM Start Backend Server
echo [1/2] Starting Backend Server (Port 5001)...
start "Backend Server" cmd /k "cd backend && npm start"
timeout /t 3 /nobreak >nul

REM Start Frontend Server
echo [2/2] Starting Frontend Server (Port 3000)...
start "Frontend Server" cmd /k "cd frontend && npm run dev"

echo.
echo ====================================
echo Servers are starting...
echo Backend:  http://localhost:5001
echo Frontend: http://localhost:3000
echo ====================================
echo.
echo Press any key to exit this window...
echo (The servers will continue running in separate windows)
pause >nul
