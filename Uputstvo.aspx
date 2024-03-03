<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Uputstvo.aspx.cs" Inherits="B12.Uputstvo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/style.css" rel="stylesheet" type="text/css" />
    <style>
        
    </style>
</head>
<body>
    <form runat="server">
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
            Veb aplikacija ze rezervaciju autobuskih karata. Korisnik klikom na dugme sa brojem sedišta, bira to mesto.
            Potrebno je da unese svoje ime, prezime i mejl adresu. Nakon klika na dugme, sedište se rezerviše za korisnika.
            Aplikacija ima 3 stranice: za rezervaciju, uputstvo i podatke o autoru.
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
