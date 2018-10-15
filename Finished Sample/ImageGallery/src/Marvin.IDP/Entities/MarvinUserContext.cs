using Microsoft.EntityFrameworkCore;

namespace Marvin.IDP.Entities
{
    public class MarvinUserContext : DbContext
    {
        public MarvinUserContext(DbContextOptions<MarvinUserContext> options)
           : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().HasData(new User()
            {
                SubjectId = "d860efca-22d9-47fd-8249-791ba61b07c7",
                Username = "Frank",
                Password = "password",
                IsActive = true,
                //Claims = {
                //         new UserClaim("role", "FreeUser"),
                //         new UserClaim("given_name", "Frank"),
                //         new UserClaim("family_name", "Underwood"),
                //         new UserClaim("address", "Main Road 1"),
                //         new UserClaim("subscriptionlevel", "FreeUser"),
                //         new UserClaim("country", "nl")
                //    }
            }, new User()
            {
                SubjectId = "b7539694-97e7-4dfe-84da-b4256e1ff5c7",
                Username = "Claire",
                Password = "password",
                IsActive = true,
                //Claims = {
                //         new UserClaim("role", "PayingUser"),
                //         new UserClaim("given_name", "Claire"),
                //         new UserClaim("family_name", "Underwood"),
                //         new UserClaim("address", "Big Street 2"),
                //         new UserClaim("subscriptionlevel", "PayingUser"),
                //         new UserClaim("country", "be")
                //}
            });

            modelBuilder.Entity<UserClaim>().HasData(new UserClaim()
            {
                Id = "358b7aee-a7a5-44a1-b134-85703943003e",
                SubjectId = "d860efca-22d9-47fd-8249-791ba61b07c7",
                ClaimType = "role",
                ClaimValue = "FreeUser"
            });

            modelBuilder.Entity<UserClaim>().HasData(new UserClaim()
            {
                Id = "c52d8821-2bfc-4cea-a1b8-7882b154c15d",
                SubjectId = "d860efca-22d9-47fd-8249-791ba61b07c7",
                ClaimType = "given_name",
                ClaimValue = "Frank"
            });

            modelBuilder.Entity<UserClaim>().HasData(new UserClaim()
            {
                Id = "69353f19-319e-49c5-b3bc-1c8f18783435",
                SubjectId = "d860efca-22d9-47fd-8249-791ba61b07c7",
                ClaimType = "family_name",
                ClaimValue = "Underwood"
            });

            modelBuilder.Entity<UserClaim>().HasData(new UserClaim()
            {
                Id = "aa4185b7-cd7a-4f5e-91a1-40e3e966ea01",
                SubjectId = "d860efca-22d9-47fd-8249-791ba61b07c7",
                ClaimType = "address",
                ClaimValue = "Main Street 1"
            });

            modelBuilder.Entity<UserClaim>().HasData(new UserClaim()
            {
                Id = "b75bb7db-dfaf-4c35-9980-cd72448130fe",
                SubjectId = "d860efca-22d9-47fd-8249-791ba61b07c7",
                ClaimType = "subscription",
                ClaimValue = "FreeUser"
            });

            modelBuilder.Entity<UserClaim>().HasData(new UserClaim()
            {
                Id = "1734fe11-2991-4299-80da-1434aa14b9f1",
                SubjectId = "d860efca-22d9-47fd-8249-791ba61b07c7",
                ClaimType = "country",
                ClaimValue = "nl"
            });

            // claire's 
            modelBuilder.Entity<UserClaim>().HasData(new UserClaim()
            {
                Id = "66b22c4e-fa9c-4f91-bb9c-6e9aaa639542",
                SubjectId = "b7539694-97e7-4dfe-84da-b4256e1ff5c7",
                ClaimType = "role",
                ClaimValue = "PayingUser"
            });

            modelBuilder.Entity<UserClaim>().HasData(new UserClaim()
            {
                Id = "9ae3a7cd-6eda-4879-9a9f-665028efe410",
                SubjectId = "b7539694-97e7-4dfe-84da-b4256e1ff5c7",
                ClaimType = "given_name",
                ClaimValue = "Claire"
            });

            modelBuilder.Entity<UserClaim>().HasData(new UserClaim()
            {
                Id = "96bd7c7e-9713-426c-96b2-47c4498c6947",
                SubjectId = "b7539694-97e7-4dfe-84da-b4256e1ff5c7",
                ClaimType = "family_name",
                ClaimValue = "Underwood"
            });

            modelBuilder.Entity<UserClaim>().HasData(new UserClaim()
            {
                Id = "e29f8ca7-98d8-40c2-babd-9b82163d6487",
                SubjectId = "b7539694-97e7-4dfe-84da-b4256e1ff5c7",
                ClaimType = "address",
                ClaimValue = "Street 1"
            });

            modelBuilder.Entity<UserClaim>().HasData(new UserClaim()
            {
                Id = "6de9bd07-eb55-4e33-8138-b6ed5bf71d61",
                SubjectId = "b7539694-97e7-4dfe-84da-b4256e1ff5c7",
                ClaimType = "subscription",
                ClaimValue = "PayingUser"
            });

            modelBuilder.Entity<UserClaim>().HasData(new UserClaim()
            {
                Id = "fad40ea8-691b-4bd4-8aac-9961653bfda2",
                SubjectId = "b7539694-97e7-4dfe-84da-b4256e1ff5c7",
                ClaimType = "country",
                ClaimValue = "be"
            });
        }

        public DbSet<User> Users { get; set; }
    }
}
