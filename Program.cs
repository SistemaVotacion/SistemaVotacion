

using Microsoft.Extensions.FileProviders;
//esto define que se creara un api
var builder = WebApplication.CreateBuilder(args);


// agregar servicio al contenedor (crea un servision en el que esta encerrado de lo demas, lo de cors permite el api se acdeda de otros servidores)
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()//permide calquier origen, cualquier servidor web
              .AllowAnyHeader()//permide calquier header cuando un servidor manda solicitudes con encabezados son los instrucciones del servidor web
              .AllowAnyMethod();//permide calquier metodo http get post etc...
    });
});

builder.Services.AddControllers(); // esta anadiendo controladores para poder usarlos 
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer(); //para que swagger pueda acceder al api 
builder.Services.AddSwaggerGen(); // esto para poder agregarlo al swagger 

var app = builder.Build(); 

app.UseStaticFiles();    //Serve files from wwwroot configurar servidor web para dar archivos estaticos
app.UseStaticFiles(new StaticFileOptions 
{
    FileProvider = new PhysicalFileProvider(
            Path.Combine(builder.Environment.ContentRootPath, "Home")),
    RequestPath = "/Home" //los archivos se sacan de la carpeta home en la carpeta principal del proyecto
});

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment()) // esta preguntado si es un  entorno de desarrollo en este aso si llo es
{
    app.UseSwagger(); // usar swagger 
    app.UseSwaggerUI(); //usar el el interfaz de usuario de swagger 
}

app.UseHttpsRedirection(); // redireccionar 


app.UseCors("AllowAll"); // activar lo de que permitimos arriba 

app.UseAuthorization(); // es par eque el api pueda funionar con un certificado para usar https 

app.MapControllers(); // revisar los ocntenidos de los controladores.

app.Run(); // correr
