<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="WebApplication5.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>NOTAS: No estan incluidos todos los DropDownList

        </div>
        <asp:DropDownList ID="ddlProfesores" runat="server" DataSourceID="SqlDataSourceProfesores" AutoPostBack="true"
            DataTextField="Nombre" DataValueField = "ID" 
            ></asp:DropDownList>
    
           <asp:SqlDataSource ID="SqlDataSourceProfesores" runat="server" connectionstring="<%$ connectionStrings:SQLConnectStringCheDB %>"
                selectcommand="SELECT ID, Nombre, Apellido FROM Cole.Profesores;">
           </asp:SqlDataSource>


         <asp:DropDownList ID="ddlAsignaturas" runat="server" DataSourceID="SqlDataSourceAsignaturas" AutoPostBack="true"
            DataTextField="Descripcion" DataValueField = "CodAsig" 
            ></asp:DropDownList>

        <!-- Fijaos en el tipo de SelectParameters elegido = ControlParameter -->
           <asp:SqlDataSource ID="SqlDataSourceAsignaturas" runat="server" connectionstring="<%$ connectionStrings:SQLConnectStringCheDB %>"
                selectcommand="SELECT CodAsig, Descripcion FROM Cole.Asignaturas WHERE IDProfesor = @IDProfesor;">
              
               <SelectParameters>
                <asp:ControlParameter Name="IDProfesor" DbType = "String" Direction = "Input" ControlID="ddlProfesores" DefaultValue="0" />
            </SelectParameters>
           </asp:SqlDataSource>


        <!-- Fijaos en los DataKeyNames, que son las claves de la tabla Nota. No aparecen como editables en el Grid  -->
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceNotas"
            autogenerateeditbutton="true" DataKeyNames="IDAlumno,IDESPECIALIDAD,CODCURSO,CODASIG">
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSourceNotas" runat="server" connectionstring="<%$ connectionStrings:SQLConnectStringCheDB %>"
                selectcommand="SELECT IDAlumno, (SELECT nombre + ' ' + apellido FROM cole.alumnos AS a WHERE a.id = n.IDALUMNO) AS Nombre, Nota, IDESPECIALIDAD, CODCURSO, CODASIG 
                    FROM cole.Notas AS n WHERE IDESPECIALIDAD='ASIR' AND CODCURSO=1 AND CODASIG=@IDAsignatura"
            updatecommand="UPDATE cole.Notas SET Nota = @Nota  WHERE IDESPECIALIDAD=@IDESPECIALIDAD AND CODCURSO=@CodCurso AND CODASIG=@CODASIG"
            >
               <SelectParameters>
                <asp:ControlParameter Name="IDAsignatura" DbType = "String" Direction = "Input" ControlID="ddlAsignaturas" DefaultValue="0" />
            </SelectParameters>
         </asp:SqlDataSource>


    </form>


</body>
</html>
