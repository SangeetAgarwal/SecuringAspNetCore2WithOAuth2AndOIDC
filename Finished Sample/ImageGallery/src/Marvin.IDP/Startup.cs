using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using System.Reflection;
using IdentityServer4;
using IdentityServer4.EntityFramework.DbContexts;
using Marvin.IDP.Entity;
using Marvin.IDP.Entities;
using Marvin.IDP.Services;
using Marvin.IDP.Extensions;

namespace Marvin.IDP
{
    public class Startup
    {
        public IConfiguration Configuration { get; }
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc();

            // Used for the IdentityServer4 EF configuration
            var migrationsAssembly = typeof(Startup).GetTypeInfo().Assembly.GetName().Name;
            var identityServerDataDBConnectionString = Configuration.GetConnectionString("identityServerDataDBConnectionString");
            var marvinUserDBConnectionString = Configuration.GetConnectionString("marvinUserDBConnectionString");

            services.AddDbContext<MarvinUserContext>(r => r.UseSqlServer(marvinUserDBConnectionString));

            services.AddScoped<IMarvinUserRepository, MarvinUserRepository>();

            services.AddIdentityServer()
                    .AddDeveloperSigningCredential()
                    .AddConfigurationStore(options =>
                    {
                        options.ConfigureDbContext = builder =>
                            builder.UseSqlServer(identityServerDataDBConnectionString,
                                sql => sql.MigrationsAssembly(migrationsAssembly));
                    })
                    .AddOperationalStore(options =>
                    {
                        options.ConfigureDbContext = builder =>
                            builder.UseSqlServer(identityServerDataDBConnectionString,
                                sql => sql.MigrationsAssembly(migrationsAssembly));
                    })
                    //.AddInMemoryIdentityResources(Config.GetIdentityResources())
                    //.AddInMemoryApiResources(Config.GetApiResources())
                    //.AddInMemoryClients(Config.GetClients())
                    //.AddTestUsers(Config.GetUsers());
                    .AddMarvinUserStore();


            services.AddAuthentication(IdentityServerConstants.DefaultCookieAuthenticationScheme);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app,
            IHostingEnvironment env,
            ConfigurationDbContext configurationDbContext,
            PersistedGrantDbContext persistedGrantDbContext,
            MarvinUserContext marvinUserContext)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            marvinUserContext.Database.Migrate();
            marvinUserContext.EnsureSeedDataForContext();

            configurationDbContext.Database.Migrate();
            configurationDbContext.EnsureSeedDataForContext();

            persistedGrantDbContext.Database.Migrate();

            app.UseIdentityServer();
            app.UseStaticFiles();
            app.UseMvcWithDefaultRoute();
        }
    }
}
