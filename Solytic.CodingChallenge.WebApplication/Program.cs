var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/api/test", () => "It works!");

app.Run();