<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
%>
<div class="container">
    <h1>${errorMessage}</h1>
    <div class="row">
        <div class="box">
            <div class="col-lg-12 text-center">
                <h2 class="brand-before">
                    <small>Welcome to</small>
                </h2>
                <h1 class="brand-name">UIU Accommodation Provider</h1>
                <hr class="tagline-divider">
                <h2>
                    <small>Powered By :</small>
                    <strong>Social Services Club</strong>
                </h2>
                <div id="carousel-example-generic" class="carousel slide">
                    <ol class="carousel-indicators hidden-xs">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="5"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="img-responsive img-full" src="<c:url value="/resources/media/front-pictures/fp1.jpg"/>" alt="" />
                        </div>
                        <div class="item">
                            <img class="img-responsive img-full" src="<c:url value="/resources/media/front-pictures/fp2.jpg"/>" alt="" />
                        </div>
                        <div class="item">
                            <img class="img-responsive img-full" src="<c:url value="/resources/media/front-pictures/fp3.jpg"/>" alt="" />
                        </div>
                        <div class="item">
                            <img class="img-responsive img-full" src="<c:url value="/resources/media/front-pictures/fp4.jpg"/>" alt="" />
                        </div>
                        <div class="item">
                            <img class="img-responsive img-full" src="<c:url value="/resources/media/front-pictures/fp5.jpg"/>" alt="" />
                        </div>
                        <div class="item">
                            <img class="img-responsive img-full" src="<c:url value="/resources/media/front-pictures/fp6.jpg"/>" alt="" />
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="icon-prev"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="icon-next"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <% if (request.getSession().getAttribute("userInformation") != null) { %>
    <div class="row">
        <div class="box">
            <div class="col-lg-12">
                <div class="intro-text text-center">
                    <hr/>
                    <strong class="h1">Most Recent Posts</strong>
                    <hr/>
                </div>
            </div>
            <% while (resultSet != null && resultSet.next()) {%>
            <div class="col-lg-12">
                <div class="box hoverable">
                    <table>
                        <thead>
                            <tr>
                                <td>
                                    <a class="" href="<%=resultSet.getString("post_id")%>">
                                        <h2 class="text-capitalize"><%= resultSet.getString("title")%></h2>
                                    </a>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Posted By: <%=resultSet.getString("name")%></td>
                            </tr>
                            <tr>
                                <td>Address: <%=resultSet.getString("address")%></td>
                            </tr>
                            <tr>
                                <td>Post Date: <%=resultSet.getString("post_date")%></td>
                            </tr>
                            <tr>
                                <td><%=resultSet.getString("quantity")%> - <%=resultSet.getString("type")%></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <% }%>
        </div>
    </div>
    <% }%>
    <div class="row">
        <div class="box">
            <div class="col-lg-12 hoverable">
                <hr/>
                <h2 class="intro-text text-center">
                    <strong class="brand-name">UIU Social Services Club</strong>
                </h2>
                <hr/>
                <img class="img-responsive img-border img-left" src="<c:url value="/resources/media/logos/l2.jpg"/>" alt="">
                <hr class="visible-xs">
                <p>UIU Social Services Club (UIUSSC) is one of the leading student activity 
                    clubs of United International University (UIU), 
                    with an aim to provide assistance to underprivileged section of the society.
                </p>
                <br/>

                <strong><b>Establish:2011(January)</b></strong>
                <p>
                    <strong><b>Mission:</b></strong>  
                    <br/>
                    The main purpose of this club is to provide social services voluntarily to 
                    people who are deprived of basic facilities and opportunities.
                </p>
                <p>
                    <strong><b>Vision:</b></strong>
                    <br/>
                    Our vision is to establish such a society where there is no privilege scarcity.
                </p>
            </div>
            <div class="col-lg-12 hoverable">
                <h2 class="intro-text text-center">
                    <strong class="brand-name">Our Activities</strong>
                </h2>
                <hr/>
                <img width="50%" height="50%" class="img-responsive img-border img-left hoverable" src="<c:url value="/resources/media/photos/p16.jpg"/>" alt="">
                <hr class="visible-xs"/>
                <p>
                    <b>
                        <ul class="h2">
                            <li class="hoverable">Blood donation</li>
                            <li class="hoverable">Charitable causes</li>
                            <li class="hoverable">Eid clothing and gifts</li>
                            <li class="hoverable">Winter clothes distribution</li>
                            <li class="hoverable">Free children education</li>
                            <li class="hoverable">Emergency crisis help</li>
                            <li class="hoverable">Social campaigns</li>
                            <li class="hoverable">Moral & Social seminars</li>
                        </ul>
                    </b>
                </p>
                <br/>
                <br/>
            </div>
            <div class="col-lg-12 hoverable">
                <h2 class="intro-text text-center">
                    <strong class="brand-name">What will  you get from this club?</strong>
                </h2>
                <hr/>
                <img width="50%" height="50%" class="img-responsive img-border img-left hoverable" src="<c:url value="/resources/media/photos/p2.jpg"/>" alt="">
                <hr class="visible-xs"/>
                <p>
                    <b>
                        <ul class="h2">
                            <li class="hoverable">It creates a sense of social responsibility.</li>
                            <li class="hoverable">UIUSSC gives you some practical experience about real life.</li>
                            <li class="hoverable">UIUSSC gives you a opportunity to enhance your humanity.</li>
                            <li class="hoverable">After every event we provide you certificates that will help in
                                your future career.</li>
                            <li class="hoverable">UIUSSC  gives you a platform where you can build up your 
                                leadership quality,communication skills,interpersonal skills etc.</li>
                            <li class="hoverable">You also get some career oriented knowledge  from this club 
                                because we maintain Chain  of command.</li>
                            <li class="hoverable">UIUSSC provides organizing  potentiality  among the members.</li>
                            <li class="hoverable">UIUSSC organizes some competitions  among the members.</li>
                            <li class="hoverable">Last but not the least  by the grace of Allah  you will be the reasons of someones smile.</li>
                        </ul>
                    </b>
                </p>
            </div>
        </div>
    </div>
</div>
