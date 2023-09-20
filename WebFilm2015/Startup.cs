using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebFilm2015.Startup))]
namespace WebFilm2015
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
