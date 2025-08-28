using InstitutoABSystems.Data;
using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;

var builder = WebApplication.CreateBuilder(args);

// 1?? Configuración de Razor Pages y Blazor
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();

// 2?? Determinar si SQL Server está disponible
bool sqlDisponible = false;
try
{
    // Intentamos conectarnos a SQL Server con la cadena del appsettings
    var tempOptions = new DbContextOptionsBuilder<AppDbContext>();
    tempOptions.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));

    using var tempDb = new AppDbContext(tempOptions.Options);
    sqlDisponible = tempDb.Database.CanConnect();
}
catch
{
    // Si falla, se queda en false y se usará SQLite
    sqlDisponible = false;
}

// 3?? Registrar DbContext con SQL Server o SQLite según disponibilidad
builder.Services.AddDbContext<AppDbContext>(options =>
{
    if (sqlDisponible)
    {
        options.UseSqlServer(
            builder.Configuration.GetConnectionString("DefaultConnection"),
            sqlOptions => sqlOptions.EnableRetryOnFailure() // opcional: reintentos
        );
        Console.WriteLine("Usando SQL Server");
    }
    else
    {
        options.UseSqlite(builder.Configuration.GetConnectionString("SQLiteTest"));

        Console.WriteLine("SQL Server no disponible, usando SQLite");
    }
});

// 4?? Construir la app
var app = builder.Build();

// 5?? Middleware
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
}
app.UseStaticFiles();
app.UseRouting();

// 6?? Mapear Blazor Hub
app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

// 7?? Ejecutar
app.Run();
