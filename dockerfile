FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS builder

COPY . .

WORKDIR /src

RUN dotnet restore

RUN dotnet publish  jenkinsDevops/jenkinsDevops.csproj -c Release -o /app


FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine

COPY --from=builder /app .

ENTRYPOINT ["dotnet", "jenkinsDevops.dll"]