<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImagesUpload.aspx.cs" Inherits="WebApplication1.ImagesUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           PASO 1: Seleccionar archivo y lo subimos al servidor.<br /> Se guarda en sistema de archivos, NO la base de datos (PASO 2: se puede guardar el nombre y  ruta del archivo en la base de datos  <br />
      
            <asp:FileUpload ID="FileUpload1" runat="server" />
            
            <asp:Button ID="btnUpload" runat="server" Text="Upload archivo" OnClick="btnUpload_Click" />

        </div>

        <br />

        PASO 3: Mostrar la Imagen que esta guardar en la BASE de DATOS<br />
        <asp:Image ID="Image1" runat="server" /><asp:Button ID="btnMostrar" OnClick="btnMostrar_Click" runat="server" Text="Mostrar Imagen" />
        
        <br />

        PASO 3: Mostrar la Imagen de base de datos en Grid con código subyacente<br />
        <asp:gridview runat="server" ID="GridView1" autogeneratecolumns="False">

            <Columns>
              <asp:boundfield datafield="FotoID" headertext="File ID" />
               <asp:templatefield headertext="Archivo">
                <itemtemplate>
                    <asp:image id="Image1" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Foto"))%>'  />  
                </itemtemplate>
                </asp:templatefield>
            </Columns>
        </asp:gridview>
        <asp:Button ID="btnMostrarenGrid" runat="server" Text="Mostrar en Grid" OnClick="btnMostrarenGrid_Click" />
    
        <br />

        PASO 4: Mostrar Imagen en Grid SIN código subyacente <br />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" connectionstring="<%$ connectionStrings:SQLConnectStringCheDB %>"
                selectcommand="SELECT * FROM Fotos;">
                     </asp:SqlDataSource>

        <asp:gridview runat="server" ID="GridView2" autogeneratecolumns="False" DataSourceID="SqlDataSource1">

            <Columns>
              <asp:boundfield datafield="FotoID" headertext="File ID" />
               <asp:templatefield headertext="Archivo">
                <itemtemplate>
                    <asp:image id="Image1" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Foto"))%>'  />  
                </itemtemplate>
                </asp:templatefield>
            </Columns>
        </asp:gridview>
        



    </form>
</body>

</html>
