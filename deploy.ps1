# 🚀 DEPLOY TO TOMCAT - PowerShell Script

# Set Java Home
$env:JAVA_HOME = "D:\java\jdk-22"

Write-Host "================================" -ForegroundColor Cyan
Write-Host "  FLOWERSTOREWEB DEPLOYMENT" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Clean & Build
Write-Host "[1/3] Building project..." -ForegroundColor Yellow
cd D:\LTweb\FlowerStoreWeb
mvn clean package -DskipTests

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Build successful!" -ForegroundColor Green
Write-Host ""

# Step 2: Stop Tomcat (if running)
Write-Host "[2/3] Checking Tomcat..." -ForegroundColor Yellow
$tomcatProcess = Get-Process -Name "tomcat*" -ErrorAction SilentlyContinue
if ($tomcatProcess) {
    Write-Host "⚠️  Tomcat is running. Please stop it manually first!" -ForegroundColor Yellow
    Write-Host "   Location: D:\xampp\tomcat\bin\shutdown.bat" -ForegroundColor Gray
    $response = Read-Host "Continue deployment anyway? (y/n)"
    if ($response -ne "y") {
        Write-Host "❌ Deployment cancelled." -ForegroundColor Red
        exit 0
    }
}

# Step 3: Copy WAR file
Write-Host "[3/3] Deploying to Tomcat..." -ForegroundColor Yellow
$warSource = "D:\LTweb\FlowerStoreWeb\target\flowerstore.war"
$warDest = "D:\xampp\tomcat\webapps\flowerstore.war"

if (Test-Path $warSource) {
    Copy-Item $warSource $warDest -Force
    Write-Host "✅ Deployed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📝 Next steps:" -ForegroundColor Cyan
    Write-Host "   1. Start Tomcat: D:\xampp\tomcat\bin\startup.bat" -ForegroundColor Gray
    Write-Host "   2. Wait 10-15 seconds for deployment" -ForegroundColor Gray
    Write-Host "   3. Access: http://localhost:8080/flowerstore" -ForegroundColor Gray
    Write-Host "   4. Admin: http://localhost:8080/flowerstore/admin" -ForegroundColor Gray
    Write-Host ""
    Write-Host "🔐 Admin Login:" -ForegroundColor Yellow
    Write-Host "   Email: admin@gmail.com" -ForegroundColor Gray
    Write-Host "   Pass:  admin123" -ForegroundColor Gray
} else {
    Write-Host "❌ WAR file not found: $warSource" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "================================" -ForegroundColor Cyan
Write-Host "  DEPLOYMENT COMPLETE! 🎉" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Cyan
