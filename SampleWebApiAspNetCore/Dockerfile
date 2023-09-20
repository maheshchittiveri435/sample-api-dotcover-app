FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
COPY SampleWebApiAspNetCore/bin/Debug/net7.0 /app
# COPY . /app
# COPY ["SampleWebApiAspNetCore/SampleWebApiAspNetCore.csproj", "SampleWebApiAspNetCore/"]
# COPY . .
EXPOSE 5124

ENV ASPNETCORE_URLS=http://+:5124

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["SampleWebApiAspNetCore/SampleWebApiAspNetCore.csproj", "SampleWebApiAspNetCore/"]
RUN dotnet restore "SampleWebApiAspNetCore\SampleWebApiAspNetCore.csproj"
COPY . .
WORKDIR "/src/SampleWebApiAspNetCore"
RUN dotnet build "SampleWebApiAspNetCore.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "SampleWebApiAspNetCore.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app

VOLUME  /app/report

# COPY --from=publish /app/publish .
# ENTRYPOINT ["dotnet", "/app/codecov/SampleWebApiAspNetCore.dll"]
# ENTRYPOINT ["sh codecov/dotCover.sh", "cover", "--TargetExecutable=codecov/SampleWebApiAspNetCore.dll", "--Output=covert.xml", "--ReportType=XML", "--Instance=1"]
# CMD ["/app/codecov/dotCover.exe", "cover", "--TargetExecutable=codecov/SampleWebApiAspNetCore.exe", "--Output=coveragedock.xml", "--ReportType=XML", "--Instance=1"]
ENTRYPOINT ["./rundotcover.sh"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]
# ENTRYPOINT ["sh /SampleWebApiAspNetCore/dotCover.sh", "cover-dotnet", "--TargetExecutable=/app/SampleWebApiAspNetCore/SampleWebApiAspNetCore.dll", "--Output=newreportdocker.xml", "--ReportType=XML", "--Instance=1"]