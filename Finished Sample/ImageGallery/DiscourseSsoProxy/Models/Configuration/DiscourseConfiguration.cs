using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DiscourseSsoProxy.Models.Configuration
{
    public class DiscourseConfiguration
    {
        public string Discourse_SSO_BaseUrl { get; set; }
        public string Discourse_Secret { get; set; }
        public string Discourse_Admins { get; set; }
        public string Discourse_Moderators { get; set; }
    }
}
