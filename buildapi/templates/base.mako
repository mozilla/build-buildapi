<%!
import time

from buildapi.lib.times import oneday, now

def formattime(t):
    if not t:
        return ""
    return time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(t))

statusText = {
    0: 'Success',
    1: 'Warnings',
    2: 'Failure',
    3: 'Skipped',
    4: 'Exception',
    5: 'Retry',
    6: 'Cancelled',
    }

def formatStatus(status):
    return statusText.get(status, '')
%>
<%def name="title()">NO TITLE</%def>\
<%def name="footer()">\
<%
    from datetime import datetime
    import time
    now = datetime.now().replace(microsecond=0)
    seconds = "%.3g" % (time.time() - c.started)
%>
Generated at ${now} in ${seconds}s. All times are Mountain View, CA (US/Pacific).
</%def>\
<%def name="breadcrumbs()"></%def>\
<%def name="header()"></%def>\
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>${self.title()}</title>
${h.tags.stylesheet_link(
    url('/jquery/css/smoothness/jquery-ui-1.8.1.custom.css'),
    url('/releng.css'),
    url('/build-status.css'),
    url('/DataTables-1.7.1/media/css/demo_page.css'),
    url('/DataTables-1.7.1/media/css/demo_table_jui.css'),
    )}
${h.tags.javascript_link(
    url('/js/jquery-ui-1.8.1.custom.min.js'),
    url('/DataTables-1.7.1/media/js/jquery.js'),
    url('/DataTables-1.7.1/media/js/jquery.dataTables.min.js'),
    )}
${next.header()}
</head>
<body>
${self.breadcrumbs()}
${self.body()}
${self.footer()}
</body>
</html>
