FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Solytic.CodingChallenge.WebApplication/Solytic.CodingChallenge.WebApplication.csproj", "Solytic.CodingChallenge.WebApplication/"]
RUN dotnet restore "Solytic.CodingChallenge.WebApplication/Solytic.CodingChallenge.WebApplication.csproj"
COPY . .
WORKDIR "/src/Solytic.CodingChallenge.WebApplication"
RUN dotnet build "Solytic.CodingChallenge.WebApplication.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Solytic.CodingChallenge.WebApplication.csproj" -c Release -o /app/publish



FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Solytic.CodingChallenge.WebApplication.dll"]
