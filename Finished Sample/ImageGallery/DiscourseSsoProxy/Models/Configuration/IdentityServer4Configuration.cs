using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DiscourseSsoProxy.Models.Configuration
{
    public class IdentityServer4Configuration
    {
        public string IdentityServerBaseUrl { get; set; }
        public string ClientId { get; set; }
        public string ClientSecret { get; set; }
    }
}
