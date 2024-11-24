using System.Diagnostics;
using API_VotoTotal.Models;


namespace API_VotoTotal.Data { 

    public static class DbInitializer
    {
        public static void Initialize(VotoTotalContext context)
        {
            // Look for any students.
            if (context.Candidatos.Any())
            {
                return;   // DB has been seeded
            }

        }
    }
}