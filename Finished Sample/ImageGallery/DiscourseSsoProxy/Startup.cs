using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;
using DiscourseSsoProxy.Models.Configuration;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;

namespace DiscourseSsoProxy
{
    public class Startup
    {
        public Startup(IConfiguration configuration, IHostingEnvironment appEnv)
        {
            Configuration = configuration;
            Configuration.GetSection(nameof(IdentityServer4Configuration)).Bind(IdentityServer4Configuration);
            Configuration.GetSection(nameof(DiscourseConfiguration)).Bind(DiscourseConfiguration);
            Environment = appEnv;
        }

        public IConfiguration Configuration { get; }
        public IdentityServer4Configuration IdentityServer4Configuration { get; set; } = new IdentityServer4Configuration();
        public DiscourseConfiguration DiscourseConfiguration { get; set; } = new DiscourseConfiguration();
        public readonly IHostingEnvironment Environment;

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);

            services.Configure<CookiePolicyOptions>(options =>
            {
                options.CheckConsentNeeded = context => false;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            if (!Environment.IsDevelopment())
            {
                services.Configure<MvcOptions>(options => { options.Filters.Add(new RequireHttpsAttribute()); });
            }

            services.AddSingleton(IdentityServer4Configuration);
            services.AddSingleton(DiscourseConfiguration);

            JwtSecurityTokenHandler.DefaultInboundClaimFilter.Clear();

            services.AddAuthentication(options =>
            {
                options.DefaultScheme = "Cookies";
                options.DefaultChallengeScheme = "oidc";

            }).AddCookie(options =>
            {
                options.AccessDeniedPath = "/Authorization/AccessDenied";
                options.ExpireTimeSpan = System.TimeSpan.FromHours(8);

            }).AddOpenIdConnect("oidc", options =>
            {
                options.SignInScheme = "Cookies";
                options.Authority = IdentityServer4Configuration.IdentityServerBaseUrl.ToLowerInvariant();
                options.RequireHttpsMetadata = true;
                options.ClientId = IdentityServer4Configuration.ClientId;
                options.ClientSecret = IdentityServer4Configuration.ClientSecret;

                options.ResponseType = "code id_token";

                options.SaveTokens = true;

                options.GetClaimsFromUserInfoEndpoint = true;

                options.Events = new Microsoft.AspNetCore.Authentication.OpenIdConnect.OpenIdConnectEvents
                {
                    OnRemoteFailure = context =>
                    {
                        var absoluteUri = string.Concat(
                            context.HttpContext.Request.Scheme,
                            "://",
                            context.HttpContext.Request.Host.ToUriComponent(),
                            context.HttpContext.Request.PathBase.ToUriComponent()
                        );

                        context.Response.Redirect(absoluteUri);
                        context.HandleResponse();
                        return Task.FromResult(0);
                    },
                    OnRemoteSignOut = context => Task.FromResult(0)
                };

            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();

            app.UseAuthentication();

            app.UseCookiePolicy();

            app.UseMvc();
        }
    }
}
