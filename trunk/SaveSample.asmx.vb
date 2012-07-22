Imports System.Web
Imports System.Web.Services
Imports System.Web.Script.Services

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://sample.com/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class SaveSample
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function SetVisibility(ByVal SectionID As string, ByVal Visible As String) As String

        'very basic stub, needs expanded with security checks and logging
        Dim ta As New SampleSettingsTableAdapters.SectionsTableAdapter
        ta.Update(SectionID, Visible, SectionID)
        Return "OK"
    End Function


End Class
