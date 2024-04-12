<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="College_List.aspx.cs" Inherits="Techpro_Project.College_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet /">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        /* Define CSS rules for GridView */
        .custom-gridview {
            border-collapse: collapse;
            width: 200%;
            margin-top:25px;
        }

        .custom-gridview th, .custom-gridview td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .custom-gridview th {
            text-align: left;
            background-color: #f2f2f2;
        }

        .custom-gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .custom-gridview tr:hover {
            background-color: #ddd;
        }

        .btn-delete 
{
    background-color: #ff3333; /* Red background color */
    color: white; /* Text color */
    border: none; /* No border */
    padding: 5px 10px; /* Padding */
    text-decoration: none; /* No underline */
    cursor: pointer; /* Cursor style */
}

.btn-edit {
    background-color: #3366ff; /* Blue background color */
    color: white; /* Text color */
    border: none; /* No border */
    padding: 5px 10px; /* Padding */
    text-decoration: none; /* No underline */
    cursor: pointer; /* Cursor style */
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style= "margin-right: 200px ;display: flex;justify-content: center";>
<form id ="form1" runat="server">

     <!-- GridView -->
   <asp:GridView ID="GV" runat="server" AutoGenerateColumns="False" OnRowCommand="GV_RowCommand" CssClass="custom-gridview">
        <Columns>
            <asp:TemplateField HeaderText="College">
                <ItemTemplate>
                    <%#Eval("college") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City">
    <ItemTemplate>
        <%#Eval("city") %>
    </ItemTemplate>
</asp:TemplateField>
            <asp:TemplateField HeaderText="State">
    <ItemTemplate>
        <%#Eval("state") %>
    </ItemTemplate>
</asp:TemplateField>
            <asp:TemplateField HeaderText="Country">
    <ItemTemplate>
        <%#Eval("country") %>
    </ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Actions">
    <ItemTemplate>
        <asp:LinkButton ID="btn2" runat="server" CommandName="D" Text="Delete" CommandArgument='<%#Eval("id") %>' CssClass="btn-delete"></asp:LinkButton>
<asp:LinkButton ID="btn3" runat="server" CommandName="E" Text="Edit" CommandArgument='<%#Eval("id") %>' CssClass="btn-edit"
    OnClientClick='<%# "return openModal(\"" + Eval("id") + "\",  \"" + Eval("college") + "\", \"" + Eval("city") + "\", \"" + Eval("state") + "\", \"" + Eval("country") + "\");" %>'>
</asp:LinkButton>


    </ItemTemplate>
</asp:TemplateField>

        </Columns>
    </asp:GridView>


    <%--Modal PopUp--%>


    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    
                    <div class="form-group">
                    <asp:HiddenField ID="hiddenID" runat="server" />
                    </div>

                    <div class="form-group">
                        <label for="name">Name:</label>
                        <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="city">City:</label>
                        <asp:TextBox ID="city" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="state">State:</label>
                        <asp:TextBox ID="state" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="country">Country:</label>
                        <asp:TextBox ID="country" runat="server" CssClass="form-control"></asp:TextBox>
                   
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnsubmit" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnupdate_Click"/>
                </div>
            </div>
        </div>
    </div>
    </div>
   </div>
     </form>
</div>


    <script>
        function openModal(id,name,city,state,country)
        {
            // Open the modal using jQuery

            // Populate modal fields with data
            $('#<%= name.ClientID %>').val(name);
            $('#<%= city.ClientID %>').val(city);
            $('#<%= state.ClientID %>').val(state);
            $('#<%= country.ClientID %>').val(country);
           
    // Optionally, you can also set the ID value in a hidden field for further processing

            $('#<%= hiddenID.ClientID %>').val(id);
            // Optionally, you can also perform any other actions you need when opening the modal
            // For example, you can load data into the modal dynamically
            // Without AJAX, you can populate the modal directly in the HTML or using server-side w');
            $('#myModal').modal('show');
            return false;
        }
    </script>

   


</asp:Content>
 