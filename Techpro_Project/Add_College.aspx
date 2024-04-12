<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Add_College.aspx.cs" Inherits="Techpro_Project.Add_College" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<form runat="server" class="form-floating" style="margin-top: 50px">

<div  class="p-3 mb-2 bg-primary-subtle text-primary-emphasis">
    <div class="form-floating mb-2">
        <asp:TextBox type="text" runat="server" class="form-control" id="name" placeholder="collegename"></asp:TextBox>
        <label for="floatingInput">College_Name</label>
    </div> 
    <br />
    <div class="form-floating">
        <asp:TextBox type="text" runat="server" class="form-control" id="city" placeholder="collegecity"></asp:TextBox>
        <label for="floatingInput">College_City</label>
    </div>
    <br />
    <div class="form-floating">
        <asp:TextBox type="text" runat="server" class="form-control" id="state" placeholder="collegestate"></asp:TextBox>
        <label for="floatingInput">College_State</label>
    </div>
    <br />
    <div class="form-floating">
        <asp:TextBox type="text" runat="server" class="form-control" id="country" placeholder="collegecountry"></asp:TextBox>
        <label for="floatingInput">Country</label>
    </div>
    <br />
   <div class="col-auto">
   <asp:Button ID="btnsave" runat="server" Text="Submit" class="btn btn-primary" OnClick="btnsave_Click" OnClientClick="alert('Record added successfully');" />
   <asp:Button ID="btnupdate" runat="server" Text="Update" class="btn btn-primary" OnClick="btnupdate_Click" OnClientClick="alert('Record updated successfully');" />
    </div>
    </div>


    
    </form>
   
   

</asp:Content>
