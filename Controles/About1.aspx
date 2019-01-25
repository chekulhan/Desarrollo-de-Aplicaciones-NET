<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About1.aspx.cs" Inherits="WebApplication1.About" %>
<%@ Register TagPrefix="TSearchbox" TagName="SearchBox" Src="~/Controles/SearchBox.ascx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information. Aqui una prueba! Y otro</p>
    <p>Mi control en web.config va aqui</p>

    <TMyWebControl:MyWebControl runat="server" edad="100" />

    <p>Fin de control 1</p>


    <TSearchbox:SearchBox runat="server" defaultText=""></TSearchbox:SearchBox>
    
    
    <p>Date of webpage: <% Response.Write(DateTime.Now); %></p>
</asp:Content>
