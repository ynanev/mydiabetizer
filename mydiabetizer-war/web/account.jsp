<%-- 
    Document   : newjspaccount
    Created on : Feb 6, 2016, 1:37:43 PM
    Author     : Tsvetelin
--%>

<%@page import="ent.Userratios"%>
<%@page import="ent.Userinfo"%>
<jsp:include page="header.jsp" />
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    Userinfo userInfo = (Userinfo) request.getAttribute("UserInfo");
    Userratios userRatio = (Userratios) request.getAttribute("UserRatio");
    boolean hasUserInfo = userInfo.getBodyType().equalsIgnoreCase("");    
%>
<div class="col-xs-12 col-sm-12 col-md-12 margin-top-100 white-background padding-10">
    <% if(hasUserInfo) { %> 
    <h3>We require some information in order to make precise and reliable calculation.</h3>
    <% } %>
    <h4 class="margin-top-20">All fields marked with <span class="required-color">*</span> are required.</h4>
    <form class="accountForm" action="/mydiabetizer-war/AccountHandler" method="POST">
        <div class="margin-top-20"><label>My kilograms:</label> <span class="required-color margin-right-10">*</span>
            <input class="kg" style="width: 80px;" type="number" min="0" name="kg" placeholder="Kg" value="<%= userInfo.getKg() %>"/>
            <span class="kgError error-color"></span>
        </div>
        <div class="margin-top-20"><label>Body type: </label><span class="required-color margin-right-10">*</span>
            <label style="font-weight: normal;" class="margin-right-10">Skinny<input <% if(userInfo.getBodyType().equals("skinny")) {%><%= "checked=\"true\"" %><%} else if(userInfo.getBodyType().equalsIgnoreCase("")) {%><%= "checked=\"true\"" %><%} %> class="margin-right-10" type="radio" name="bodyType" value="skinny"/></label>
            <label style="font-weight: normal;" class="margin-right-10">Slim<input <% if(userInfo.getBodyType().equals("slim")) {%><%= "checked=\"true\"" %><%} %> type="radio" name="bodyType" value="slim"/></label>
            <label style="font-weight: normal;" class="margin-right-10">Athletic<input <% if(userInfo.getBodyType().equals("athletic")) {%><%= "checked=\"true\"" %><%} %>type="radio" name="bodyType" value="athletic"/></label>
            <label style="font-weight: normal;" class="margin-right-10">Heavy<input <% if(userInfo.getBodyType().equals("heavy")) {%><%= "checked=\"true\"" %><%} %> type="radio" name="bodyType" value="heavy"/></label>
            <label style="font-weight: normal;" class="margin-right-10">Heavy-Muscular<input <% if(userInfo.getBodyType().equals("fat")) {%><%= "checked=\"true\"" %><%} %> type="radio" name="bodyType" value="fat"/></label>
        </div>
        <div class="margin-top-20"><label>Daily total rapid insulin doses: </label> <input type="text" name="rapidDoses" placeholder="" value="<%= userInfo.getTotalInsulinD() %>"/></div>
        <div class="margin-top-20"><label>Date of birth: </label><span class="required-color margin-right-10">*</span>
            <input class="dateOfBirth" type="text" name="dateOfBirth" placeholder="e.g DD-MM-YYYY" value=""/>
            <span class="dateOfBirthError error-color"></span>
        </div>
        <div class="margin-top-20"><label class="margin-right-10">Ratio: </label> 
            <span class="margin-right-10">Breakfast</span><input class="ratio margin-right-20" style="width: 80px;" type="number" min="0" name="breakfastRatio" placeholder="" value="<%= userRatio.getBreakfast() %>"/>
            <span class="margin-right-10">Lunch</span><input class="ratio margin-right-20" style="width: 80px;" type="number" min="0" name="lunchRatio" placeholder="" value="<%= userRatio.getLunch() %>"/>
            <span class="margin-right-10">Dinner</span><input class="ratio margin-right-20" style="width: 80px;" type="number" min="0" name="dinnerRatio" placeholder="" value="<%= userRatio.getDiner() %>"/>
            <span class="margin-right-10">General</span><input class="ratio generalRatio" style="width: 80px;" type="number" min="0" name="generalRatio" placeholder="" value="<%= userRatio.getGeneral() %>"/>
            <!-- From here -->
            <div class="info-paragraph-wrapper" style="display: inline;position: relative;">
                <span class="glyphicon glyphicon-info-sign"></span>
                <p class="info-paragraph white-color">Ratio is very important to calculate  the grams of carbohydrate disposed of by 1 unit of insulin coverage at each meal!If know your ratios please provide them!If you don`t have the ratios the system will calculate them according to you personal data:]  </p>
            </div>
            <!-- til here -->
        </div>
        <div><input class="btn btn-primary btn-transparent pull-right" type="submit" name="submit" value="Save"/></div>
    </form>
</div>
<jsp:include page="account-footer.jsp" />
