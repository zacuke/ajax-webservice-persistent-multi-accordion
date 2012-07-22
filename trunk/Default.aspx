<%@ Page Title="Home Page" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="MultiAccordion._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <body>
        <%--This goes on the aspx page because it reads the public variable DefaultOpenSections to get the defaults.
        --%>
        <script type="text/javascript">
	     function pageLoad() {

            var MyDef = [<% =DefaultOpenSections %>]; // literal array

            $('#multiAccordion').multiAccordion({
                active: MyDef,
                click: function (event, ui) {
                    //console.log('clicked')

                },
                init: function (event, ui) {
                    //console.log('init')
                },
                tabShown: function (event, ui) {
                        $.ajax({
                        type: "POST",
                        url: "<% =Page.ResolveUrl("~/SaveSample.asmx/SetVisibility") %>",
                        data: "SectionID=" + ui.id + "&Visible=true",
                        success: function (msg) {
                        //  alert(msg.d);
                        }
                    });
                },
                tabHidden: function (event, ui) {
                       $.ajax({
                        type: "POST",
                        url: "<% =Page.ResolveUrl("~/SaveSample.asmx/SetVisibility") %>",
                        data: "SectionID=" + ui.id + "&Visible=false",
                        success: function (msg) {
                        //  alert(msg.d);
                        }
                    });}
            });
        }
        </script>
        <div id="multiAccordion">
            <h3>
                <a href="#">tab 1</a></h3>
            <div id="1">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
                irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                deserunt mollit anim id est laborum.
            </div>
            <h3>
                <a href="#">tab 2</a></h3>
            <div id="2">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu mauris nulla, at
                cursus nulla. Morbi venenatis, risus sit amet ultricies pharetra, lorem purus tempor
                risus, vel tincidunt lectus nisi sit amet neque. Aenean sit amet nibh orci, a gravida
                eros. Pellentesque dignissim, libero eu congue semper, mauris metus molestie nisi,
                vitae posuere felis leo ac lectus. Mauris a nisi eget sapien varius eleifend vel
                vel nibh. In placerat commodo blandit. Vivamus sagittis ante sed nisl sodales id
                luctus diam dapibus. Proin a felis tristique nulla rhoncus sollicitudin. Nullam
                sit amet neque augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices
                posuere cubilia Curae; Fusce at nisi sapien.
            </div>
            <h3>
                <a href="#">tab 3</a></h3>
            <div id="3">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
                irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                deserunt mollit anim id est laborum.
            </div>
            <h3>
                <a href="#">tab 4</a></h3>
            <div id="4">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu mauris nulla, at
                cursus nulla. Morbi venenatis, risus sit amet ultricies pharetra, lorem purus tempor
                risus, vel tincidunt lectus nisi sit amet neque. Aenean sit amet nibh orci, a gravida
                eros. Pellentesque dignissim, libero eu congue semper, mauris metus molestie nisi,
                vitae posuere felis leo ac lectus. Mauris a nisi eget sapien varius eleifend vel
                vel nibh. In placerat commodo blandit. Vivamus sagittis ante sed nisl sodales id
                luctus diam dapibus. Proin a felis tristique nulla rhoncus sollicitudin. Nullam
                sit amet neque augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices
                posuere cubilia Curae; Fusce at nisi sapien.
            </div>
        </div>
    </body>
</asp:Content>
