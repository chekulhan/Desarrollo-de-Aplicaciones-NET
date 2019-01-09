<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="WebApplication1.WebUserControl1" %>
<%@ OutputCache Duration="60" VaryByParam="none" %>

<table>
	<tr>
	  <td>My control</td>
	</tr>
	
	<tr>
	  <td> this is my control  <% Response.Write(DateTime.Now); %> </td>
	</tr>
    <tr>
	  <td> this is <% Response.Write(this.edad); %>  </td>
	</tr>
</table>
