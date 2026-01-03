# 🔧 QUICK BUILD & DEPLOY

Write-Host "🚀 Quick Deploy FlowerStoreWeb..." -ForegroundColor Cyan

# Set JAVA_HOME
$env:JAVA_HOME = "D:\java\jdk-22"

# Navigate to project
cd D:\LTweb\FlowerStoreWeb

# Build
Write-Host "📦 Building..." -ForegroundColor Yellow
mvn clean package -DskipTests -q

if ($LASTEXITCODE -eq 0) {
    # Deploy
    Write-Host "🚀 Deploying..." -ForegroundColor Yellow
    Copy-Item target\flowerstore.war D:\xampp\tomcat\webapps\flowerstore.war -Force
    
    Write-Host "✅ Done!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Admin: http://localhost:8080/flowerstore/admin" -ForegroundColor Cyan
    Write-Host "Login: admin@gmail.com / admin123" -ForegroundColor Gray
} else {
    Write-Host "❌ Build failed!" -ForegroundColor Red
}
