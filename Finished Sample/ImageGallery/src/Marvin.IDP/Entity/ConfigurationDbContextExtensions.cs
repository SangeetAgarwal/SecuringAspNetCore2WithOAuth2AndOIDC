using IdentityServer4.EntityFramework.DbContexts;
using IdentityServer4.EntityFramework.Mappers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Marvin.IDP.Entity
{
    public static class ConfigurationDbContextExtensions
    {
        public static void EnsureSeedDataForContext(this ConfigurationDbContext context)
        {
            if (!context.Clients.Any())
            {
                foreach (var item in Config.GetClients())
                {
                    context.Clients.Add(item.ToEntity());
                }
                context.SaveChanges();
            }

            if (!context.ApiResources.Any())
            {
                foreach (var item in Config.GetApiResources())
                {
                    context.ApiResources.Add(item.ToEntity());
                }
                context.SaveChanges();
            }

            if (!context.IdentityResources.Any())
            {
                foreach (var item in Config.GetIdentityResources())
                {
                    context.IdentityResources.Add(item.ToEntity());
                }
                context.SaveChanges();
            }
        }
    }
}
