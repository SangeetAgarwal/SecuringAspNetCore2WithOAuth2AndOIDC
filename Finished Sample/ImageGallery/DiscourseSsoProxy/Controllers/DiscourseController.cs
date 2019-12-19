using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Web;
using DiscourseSsoProxy.Models.Configuration;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Primitives;

namespace DiscourseSsoProxy.Controllers
{
    [ApiController]
    public class DiscourseController : ControllerBase
    {
        #region Fields

        private readonly DiscourseConfiguration _discourseConfiguration;

        #endregion

        #region Constructors

        public DiscourseController(DiscourseConfiguration discourseConfiguration)
        {
            _discourseConfiguration = discourseConfiguration;
        }

        #endregion

        #region Endpoints

        [Route("sso/singlesignin")]
        public async Task<ActionResult> SingleSignIn()
        {
            var payload = Request.Query["sso"];
            var sig = Request.Query["sig"];

            // Validate the payload
            var hashedPayload = GetDiscourseHash(payload);

            // If the payload hash isn't correct, then throw an error
            if (hashedPayload != sig)
                throw new ApplicationException("Hash validation not met");

            if (User.Identity.IsAuthenticated)
            {
                return await CompleteSsoAsync();
            }
            else
            {
                // I'm not sure what is the best way of persisting the nonce so this is a temporary hack 
                Response.Cookies.Append("sso", payload);

                return RedirectToAction("SingleSignInCompletion");
            }
        }

        [Authorize]
        [Route("sso/singlesignincompletion")]
        public async Task<ActionResult> SingleSignInCompletion()
        {
            return await CompleteSsoAsync();
        }

        [Route("sso/singlesignout")]
        public async Task<ActionResult> SingleSignOut()
        {
            await HttpContext.SignOutAsync("Cookies");
            await HttpContext.SignOutAsync("oidc");

            return new EmptyResult();
        }
        #endregion

        #region Helpers

        private async Task<ActionResult> CompleteSsoAsync()
        {
            StringValues payload;

            if (Request.Query["sso"].Count == 0)
            {
                payload = Request.Cookies["sso"];
            }
            else
            {
                payload = Request.Query["sso"];
            }

            // get the nonce that discourse sent to us per https://meta.discourse.org/t/official-single-sign-on-for-discourse-sso/13045
            var ssoBytes = Convert.FromBase64String(payload);
            var decodedSso = System.Text.Encoding.UTF8.GetString(ssoBytes);
            var nvc = HttpUtility.ParseQueryString(decodedSso);
            var nonce = nvc["nonce"];

            // get the unique id
            var uniqueId = ((ClaimsIdentity)User.Identity).FindFirst(r => r.Type == "sid").Value;

            // get the unique id
            // var emailAddress = ((ClaimsIdentity)User.Identity).FindFirst(r => r.Type == "email").Value;

            // var isAdmin = _discourseConfiguration.Discourse_Admins.Contains(emailAddress);

            // var isModerator = _discourseConfiguration.Discourse_Moderators.Contains(emailAddress);

            var ssoDictionary = new Dictionary<string, string>
            {
                {"nonce", nonce},
                {"email", "abc@xyz.com"},
                {"external_id", uniqueId},
                {"admin", "true"},
                {"moderator", "true"}
            };

            var returnSso = string.Join("&", ssoDictionary.Select(x => $"{x.Key}={x.Value}"));

            var base64EncodedSso = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(returnSso));

            var returnHashedSig = GetDiscourseHash(base64EncodedSso);

            var discourseRedirectUrl =
                $"{_discourseConfiguration.Discourse_SSO_BaseUrl}?sso={base64EncodedSso}&sig={returnHashedSig}";

            return Redirect(discourseRedirectUrl);
        }

        private string GetDiscourseHash(string encodedPayload)
        {
            using (var hasher = new HMACSHA256(System.Text.Encoding.UTF8.GetBytes(_discourseConfiguration.Discourse_Secret)))
            {
                var hash = hasher.ComputeHash(System.Text.Encoding.UTF8.GetBytes(encodedPayload));
                return BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant();
            }
        }
        #endregion
    }
}