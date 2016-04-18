<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <h1>${errorMessage}</h1>
    <div class="row">
        <div class="box">
            <div class="col-lg-12 text-center">
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
                <h2 class="brand-before">
                    <small>Welcome to</small>
                </h2>
                <h1 class="brand-name">UIU Accommodation Provider</h1>
                <hr class="tagline-divider">
                <h2>
                    <small>Powered By :</small>
                    <strong>Social Services Club</strong>
                </h2>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="box">
            <div class="col-lg-12">
                <hr/>
                <h2 class="intro-text text-center">What is
                    <strong class="">Accommodation Provider</strong>
                </h2>
                <hr/>
                <img class="img-responsive img-border img-left" src="<c:url value="/resources/media/logos/l2.jpg"/>" alt="">
                <hr class="visible-xs">
                <p>Social Services Club's Content will be shown here.
                Social Services Club's Content will be shown here.
                Social Services Club's Content will be shown here.
                Social Services Club's Content will be shown here.
                Social Services Club's Content will be shown here.
                Social Services Club's Content will be shown here.
                Social Services Club's Content will be shown here.
                Social Services Club's Content will be shown here.
                Social Services Club's Content will be shown here.
                Social Services Club's Content will be shown here.
                Social Services Club's Content will be shown here.
                </p>
            </div>
        </div>
    </div>
</div>
