<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CodingTest1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link href="style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblInfo" runat="server" Text="Your Basic Information" CssClass="lblLarge"></asp:Label>
            <asp:Label ID="lblName" runat="server" Text="Full Name" CssClass="lblSmall"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" CssClass="input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFValTxtName" runat="server" ControlToValidate="txtName" CssClass="valError" ErrorMessage="Name is required" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExValtxtName" runat="server" ControlToValidate="txtName" CssClass="valError" ErrorMessage="Incorrect name format" ValidationExpression="\D+\s\D+"></asp:RegularExpressionValidator>
            <asp:Label ID="lblCompany" runat="server" Text="Company Name" CssClass="lblSmall"></asp:Label>
            <asp:TextBox ID="txtCompany" runat="server" CssClass="input"></asp:TextBox>
            <br />
            <asp:Label ID="lblBirthDate" runat="server" Text="Birth Date: " ></asp:Label>
            <asp:DropDownList ID="ddlMonth" runat="server" CssClass="ddlBirthDate">
                <asp:ListItem>Select</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RFValDDLMonth" runat="server" ErrorMessage="Month is required" ControlToValidate="ddlMonth" CssClass="valError" Display="Dynamic" InitialValue="Select"></asp:RequiredFieldValidator>
            <asp:DropDownList ID="ddlDay" runat="server" CssClass="ddlBirthDate"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RFValDDLDay" runat="server" ErrorMessage="Day is required" ControlToValidate="ddlDay" CssClass="valError" Display="Dynamic" InitialValue="Select"></asp:RequiredFieldValidator>
            <asp:DropDownList ID="ddlYear" runat="server" CssClass="ddlBirthDate"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RFValDDLYear" runat="server" ErrorMessage="Year is required" ControlToValidate="ddlYear" CssClass="valError" Display="Dynamic" InitialValue="Select"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblMonth" runat="server" Text="Month"></asp:Label>
            <asp:Label ID="lblDay" runat="server" Text="Day" CssClass="lblDayYear"></asp:Label>
            <asp:Label ID="lblYear" runat="server" Text="Year" CssClass="lblDayYear"></asp:Label>

            <asp:Label ID="lblMembership" runat="server" Text="Choose your membership" CssClass="lblLarge"></asp:Label>
            <asp:RadioButtonList ID="listRadioMembership" runat="server" CssClass="input" AutoPostBack="True" OnSelectedIndexChanged="listRadioMembership_SelectedIndexChanged">
                <asp:ListItem Value="Free">Free</asp:ListItem>
                <asp:ListItem Value="Basic">Basic</asp:ListItem>
                <asp:ListItem Value="Premium">Premium</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label ID="lblFee" runat="server" Text="Total Fee:" CssClass="lblSmall" style="display:inline-block"></asp:Label>
            <asp:Label ID="lblAmount" runat="server" Text="$0"></asp:Label>
            <asp:CustomValidator ID="CustValMembership" runat="server" ControlToValidate="listRadioMembership" CssClass="valError" ErrorMessage="Premium member must be atleast 17 years old" OnServerValidate="CustValMembership_ServerValidate"></asp:CustomValidator>
            <asp:Label ID="lblAccountDetails" runat="server" Text="Your Account Details" CssClass="lblLarge"></asp:Label>
            <asp:Label ID="lblEmail" runat="server" Text="Email address" CssClass="lblSmall"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFValTxtEmail" runat="server" ControlToValidate="txtEmail" CssClass="valError" ErrorMessage="Email is required" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExTxtEmail" runat="server" ControlToValidate="txtEmail" CssClass="valError" ErrorMessage="Email is not in proper format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:CustomValidator ID="CustValEmail" runat="server" ControlToValidate="txtEmail" CssClass="valError" ErrorMessage="Must be office email" OnServerValidate="CustValEmail_ServerValidate"></asp:CustomValidator>
            <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="lblSmall"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFValTxtPassword" runat="server" ControlToValidate="txtPassword" CssClass="valError" ErrorMessage="Password is required" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExPassword" runat="server" ControlToValidate="txtPassword" CssClass="valError" ErrorMessage="Password should be minimum 8 characters" ValidationExpression="\w{8,}"></asp:RegularExpressionValidator>
            <asp:Label ID="lblReenterPwd" runat="server" Text="Re-enter Password" CssClass="lblSmall"></asp:Label>
            <asp:TextBox ID="txtReenter" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompValPassword" runat="server" ErrorMessage="Passwords do not match" ControlToCompare="txtPassword" ControlToValidate="txtReenter" CssClass="valError"></asp:CompareValidator>
            <asp:Button ID="btnSignup" runat="server" Text="Sign up" CssClass="btn" OnClick="btnSignup_Click"/>
        </div>
    </form>
</body>
</html>
