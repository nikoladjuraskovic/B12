<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pocetna.aspx.cs" Inherits="B12.Pocetna" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="page">
        <div class="header">
            <div class="title">
                <h1>
                    Rezervacija autobuskih karata
                </h1>
            </div>
            <div class="loginDisplay">
                <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                    <AnonymousTemplate>
                       
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        Welcome <span class="bold"><asp:LoginName ID="HeadLoginName" runat="server" /></span>!
                        [ <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Log Out" LogoutPageUrl="~/"/> ]
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
            <div class="clear hideSkiplink">
                <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
                    <Items>
                        <asp:MenuItem NavigateUrl="~/Pocetna.aspx" Text="Početna"/>
                        <asp:MenuItem NavigateUrl="~/Autor.aspx" Text="O autoru"/>
                        <asp:MenuItem NavigateUrl="~/Uputstvo.aspx" Text="Uputstvo"/>
                    </Items>
                </asp:Menu>
            </div>
        </div>
        <div class="main">
            

            <span>PRIKAZ SEDIŠTA AUTOBUSA:</span>
            

            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
           
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server" CssClass="Seats" BorderColor="Gray"></asp:Panel>
            <br />
            <br />
            <br />
            
            <asp:Label ID="Label1" runat="server" Text="Broj sedista: ">
       
            </asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Width="202px"></asp:TextBox>

            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Ime i prezime: "></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Width="202px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="E-mail: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" Width="201px" TextMode="Email"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Posalji" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label5" runat="server"></asp:Label>


        </div>
        <div class="clear">
        </div>
    </div>
    <div class="footer">
        &copy; Autobuska stanica
    </div>
    </form>
</body>
</html>
