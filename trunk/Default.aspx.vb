Public Class _Default
    Inherits System.Web.UI.Page

    'manipulate this to change default
    Public DefaultOpenSections As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ta As New SampleSettingsTableAdapters.SectionsTableAdapter
        Dim dt = ta.GetData()

        'trick is to convert the ID from database into zero based
        'index on the web UI.

        Dim counter As Integer = 0

        For Each dr As DataRow In dt.Rows
            If dr("Visible") Then
                DefaultOpenSections = DefaultOpenSections & counter & ","
            End If

            'increment the webui counter
            counter+=1
        Next

        DefaultOpenSections = DefaultOpenSections.TrimEnd(New Char() {","})

        If DefaultOpenSections = "" Then
            'close all
            DefaultOpenSections = "-1"
        End If

    End Sub

End Class