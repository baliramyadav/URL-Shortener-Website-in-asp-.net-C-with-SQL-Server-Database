<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>URL Shortener</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="Asset/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <!-- Navbar -->
   <nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="Default.aspx">Turbo URL Shortener</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="Default.aspx">HOME</a></li>
        <li><a href="About.aspx">ABOUT</a></li>
        <%--<li><a href="#">CONTACT</a></li>--%>
      </ul>
    </div>
  </div>
</nav>
    <!-- First Container -->
    <div class="container-fluid bg-1 text-center">
        <h3 class="text-center">
            URL Shortener </h3>
        <img src="img/logo.png" class="img-responsive img-circle margin" style="display: inline"
            alt="Logo" width="150" height="150">
        <h3>
            <%--I'm a Developer !--%> Assignment !</h3>
    </div>
    <!-- Second Container -->
    <div class="container-fluid bg-2 text-center">
        <h2 class="text-center ">
        </h2>
        <div class="row">
            <div class="col-sm-2">
            </div>
            <div class="col-sm-8">
                <div class="form-group">
                    <label>
                        Enter Your URL</label>
                    <asp:TextBox ID="txtURL" CssClass="form-control" runat="server" placeholder="https://www.google.com/"
                        Height="50"></asp:TextBox>
                    <p>
                    </p>
                    <asp:Button ID="btnShortURL" CssClass="btn btn-success btn-lg" runat="server" Text="Short URL"
                        OnClick="btnShortURL_Click" />
                </div>
            </div>
            <div class="col-sm-2">
            </div>
        </div>
    </div>
    <!-- Third Container (Grid) -->
    <div class="container-fluid bg-3 text-center">
        <h3 class="margin">
            List of Short URL's</h3>
        
        <div class="row">
            
            <div class="col-sm-2">
            </div>
            <div class="col-sm-8">
                <div class="table table-responsive">
                    <div id="popup" style="max-height: 600px; overflow-y: scroll;">
                        <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover" 
                            runat="server"  Font-Size="Small" AutoGenerateColumns="False" BackColor="White" 
                            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                            GridLines="Vertical">
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" ForeColor="White" HorizontalAlign=Center 
                                Font-Bold="True" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" BackColor="#EEEEEE" ForeColor="Black" />
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:BoundField DataField="UrlID" HeaderText="#" />
                                <asp:BoundField DataField="LongURL" HeaderText="LongURL" />                                

                                <asp:TemplateField HeaderText="Short links" ItemStyle-Width="12%" HeaderStyle-Width="12%">                                    
                                    <ItemTemplate>
                                        <asp:HyperLink ID="lblgrdReferencelink" runat="server" Text='<%# Eval("ShortURL") %>'
                                            ForeColor="Blue" Target="_blank" NavigateUrl='<%# Eval("LongURL") %>'></asp:HyperLink>
                                    </ItemTemplate>

<HeaderStyle Width="12%"></HeaderStyle>

<ItemStyle Width="12%"></ItemStyle>
                                </asp:TemplateField>

                            </Columns>
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="col-sm-2">
            </div>
        </div>
    </div>
    <!-- Footer -->
    <footer class="container-fluid bg-4 text-center">
  <p> Made By <a href="#">Baliram Yadav</a></p> 
</footer>
    </form>
</body>
</html>
