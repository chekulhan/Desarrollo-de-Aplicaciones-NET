using System;
using System.Linq;
using System.Collections.Generic;
using dotnetcoreEFconsole.Models;

// OJO: Incluir     <PackageReference Include="Microsoft.EntityFrameworkCore.Relational" Version="3.1.0"/> con NUGET
using Microsoft.EntityFrameworkCore;

/*
CREATE OR REPLACE FUNCTION public."GetPartners"()
  RETURNS SETOF res_partner AS
'SELECT * FROM res_partner'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public."GetPartners2"()
  OWNER TO openpg;

OJO - ha que devolver SETOF res_partner
 SELECT * FROM public."GetPartners"() - incluir las """ comillas en consulta SELECT

*/

namespace dotnetcoreEFconsole
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Uso de funciones o SP!");
            using (var context = new ODOODBContext()) {

                //List<ResPartner> partners = context.ResPartner.ToList();
                string s = @"SELECT * FROM public." + (char)34 + "GetPartners" + (char)34 + "()";
                List<ResPartner> partners = context.ResPartner.FromSqlRaw(s).ToList();

                foreach (ResPartner partner in partners)
                {
                    Console.WriteLine(partner.DisplayName);
                }

            }
            Console.WriteLine("END!");
        }
    }
}
