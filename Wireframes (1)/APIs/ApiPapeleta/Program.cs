var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
var MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: MyAllowSpecificOrigins,
                      policy =>
                      {
                          policy.AllowAnyOrigin();// solo para prueba, hay que cambiarlo para que solo sea nuestra pagina web
                                                  // https://learn.microsoft.com/en-us/aspnet/core/security/cors?view=aspnetcore-6.0
                          policy.AllowAnyHeader();//permide calquier header cuando un servidor manda solicitudes con encabezados son los instrucciones del servidor web
                      policy.AllowAnyMethod();//permide calquier metodo http get post etc...
                      });
});

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseCors(MyAllowSpecificOrigins);

app.UseAuthorization();

app.MapControllers();

app.Run();
