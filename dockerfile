FROM microsoft/dotnet:2.0-sdk
WORKDIR /app

#Copy csproj and restore as distinct layers
Copy *.csproj ./
RUN dotnet restore

#Copy and build everything else
Copy . ./
RUN dotnet publish -c release -o out
ENTRYPOINT ["dotnet","out/HelloWorld.dll"]