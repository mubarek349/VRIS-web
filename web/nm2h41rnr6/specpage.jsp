<%if(session.getAttribute("username") != null){
        String uType = session.getAttribute("uType").toString();
        String link = null;
        String link_name = null;

        switch (uType) {
            case "superadmin":
                link = "superadmin.jsp";
                link_name = "Federal Admin";
                break;
            case "reg_admin":
                link = "regadmin.jsp";
                link_name = "Regional Admin";
                break;
            case "zone_admin":
                link = "zoneadmin.jsp";
                link_name = "Zone Admin";
                break;
            case "wereda_admin":
                link = "weredaadmin.jsp";
                link_name = "Wereda Admin";
                break;
            case "kebele_emp":
                link = "kebele.jsp";
                link_name = "Kebele Admin";
                break;
            case "hospital_emp":
                link = "hospital.jsp";
                link_name = "Hospital Employee";
                break;
            case "court_emp":
                link = "court.jsp";
                link_name = "Court Employee";
                break;
            case "csa":
                link = "csa.jsp";
                link_name = "CSA Admin";
                break;
            case "moe":
                link = "moe.jsp";
                link_name = "MOE Admin";
                break;
        }
    
%>
<li class="nav-item">
    <a class="nav-link" href=<%= link%>> <%= link_name%> <span class="sr-only">(current)</span></a>
</li><%}%>