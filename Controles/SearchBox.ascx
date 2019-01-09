<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchBox.ascx.cs" Inherits="WebApplication1.Controles.SearchBox" %>

<style type="text/css">
.Sbutton
    {
        padding: 6px 10px;
        background: #B4D7FA;
        border: 1px solid #6a6f95;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0 0 4px rgba(0,0,0, .75);
        -moz-box-shadow: 0 0 4px rgba(0,0,0, .75);
        box-shadow: 0 0 4px rgba(0,0,0, .75);
        color: rgb(8, 8, 8);
        font-weight: bold;
        margin-top: 14px;
    }
    .Sbutton:hover
    {
         /*make the background a little darker*/ 
         /*reduce the drop shadow size to give a pushed button effect*/
        background-color: #6cafe0; 
        -webkit-box-shadow: 0 0 1px rgba(0,0,0, .75);
        -moz-box-shadow: 0 0 1px rgba(0,0,0, .75);
        box-shadow: 0 0 1px rgba(0,0,0, .75);
        color: White;
        font-weight: bold;
    }
    .txtbox
    {
        border: solid 1px #6cafe0;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        box-shadow: 0 0 1px rgba(0,0,0, .75);
        width: 220px;
        height: 25px;
        font-family: verdana,arial,sans-serif;
        font-size: 11px;
        margin-left: 20px;
        margin-right: 6px;
    }
</style>

<asp:TextBox ID="txtSearch" runat="server" CssClass="txtbox" placeholder="Search Here...">
</asp:TextBox>
<asp:Button ID="btnSearch" CssClass="Sbutton" runat="server" Text="Search" />