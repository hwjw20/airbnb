<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header>
			<div class="d-flex justify-content-between pt-3">
				
				<div class="d-flex pl-3">
					<a href="/rooms/list/view"><img id="logoImg" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAflBMVEX/////Wl//WF3/Vlv/T1X/VFn/Ulf/TVP/S1H/+vr/SU//X2T/Vlz/+fn/9fX/3d7/cHT/3t//sLL/wsP/Z2v/gYX/fYH/naD/vb//5uf/7e7/ysv/1db/aW3/o6X/iYz/dnr/trj/k5b/jpH/hon/n6L/qKr/ycr/0dL/wcKSGPbcAAARJElEQVR4nN1d6WKyvBKuAQIKrsW1atFatfd/g0e7fZ0n+4L6nvlbSwiT2Z+ZPD3diPrDxfG1qctOWY5m+8nL6lYL34T6w22T5jxLGOtciFUZT3v12/P/yy7H2zrnVQeJZSk7vNz75SLQepZyJmzvd5Pl7t4vGEjrpkgU2/veZMoW937JAFq9FuLpFPaYN8N7v6gv7Vhm3N+VEj6/96t60WCaq+RPPKqbf1Ctjks7Bn6zsTrf+4Vd6SUzSyBl48e9X9mNPqxP6O8Wi39Kpy4K1w3+Y1s8OXPwc4vpP+PhjFPlBtknqf6YLe/96nbUL+VKpspSnlWXDSY85Ylsm1XZvffLW9FBZiYY56P5aTy4/qC/PE9mLJV8B36498vb0CSViVi5hRO4WjQSly6d3OelXWgpCiHj2a4v+enFLcffsvzxfdRaYEyldjtPguPDylu+rA9thTOalWv1zwcH/D3f3+5lfWgsRLu8GWj/44i2M9V8kAegGca7fGr6l10Oh3p0ixf1pQW8bSczblDcYv7A+rTfgRNX1TIdijSnssgy/bm+J2053SDL7dywhp7txw35VwWc0fxk+Y/gqhaPGvHvwbjZK36Q3+ytzdf0p2VGOcGshPCLqA5+1CADWVg4pF6W9IA/ptlfgtLPXl3++0iUFEsfkYmvlIWMO6mLQUmOePaATIRz1uFHt//fUaP4gOoU4l7WcTTb3Udn4hBiBO7selEmsvTRmIgsLO0txQ9Rl+/RHBtkYepRFqRmnyWPxcQpSqHPQzYkPfBYTByCIs29ihCnB5ZECA7Yxu8xI8LER1Kn6x6w8NnvOS/ULeo9DhMbml+rGt8HARMfJsQ4oyL1rrCsiTwzPo75mgEEUhiSSqJR1KMwEaSnUwSkA4f0WeljMJEKzyXwDXnYlDLxISo1J7SFQaXcNYQYj1DGqDF3EVYDpJKYzCK9ZQA9oyINxFSAe5TfP8e/oSwMz8k/GhMXwELbFKmagInpnaFEXUEKw59J1WnShD8xhLAU45JBVBHEmsV9MSglSGET46E0X3DfapsghVGE5pGYCCyMpfioJFae0WYM2qEtjGS8xjTeTIP1sy/163ZYKDDxbpKILOxFcyLH4NjciYlY07ap2dsSLYL45n1CCeFdecRgDlArvomfQIKCqFs1zUTAxLsgpZCFcZMqY+os+SVgw2iAUhiVhejYxPB3XWkCyBJLYIk1QT0yvTkIHGq20VkoqtNbw4dRCnvRC+8AVA1L/7hTH3DabdQY3u6qToGFjLeAnVjyOzKxW7XPwvvaRFCkLWGYVhBi3JCJgiJtqdIHkhiYiXUhQZG2VOgDmNXtmCgEFa0Va+/FRFSk7RXc76ROuxBUtAmauI9NRBa2CQYd07Vuw8TbSeGV7mET0Ra6oSxdaXl7m9i/kS38IcrE6gYhhpBgaxn0gsF+6xmbbud2ivSL0Ca2vd7uBkEFpVun3aD3ww1UP1iOhxcar5yE6bYZG2ShrS3srnevmyTjnKcp51lWzo7Wc5RQEltNgHe9FOlqMc1znv1pU//s5+6NtnZlgFtWMYR6oZkP3ZcpT+VTeBjPRxMLTmJlv0UmYtXeAne2q3Np6/0PQzibm/cITGwibEVBQtXe9HILrh6v8MPIrDc3NS4A2q3ForCjFK43dvMxuHFU1K0k8Zl+SpMtnOe2I2pYPtOfBkS7tYWxcZLC5QbS/lrKmP7kURRyW0x8RndGV2x6tmbg99N6W93a65sApQBHqq1UTHrOE2pyrVTTxdtBuyEUWFep2GLXug2lOrjsGZjYBu4UAPm6qv27zwYN0wno8m2Ah88IBVZL4RF7ur+JVdnVM73OwJT/INXorhdQp/ER4CiF6o/4IeUg40XSvM232+N2ftjkeSbbpW6cAvRiRAR+fNEaWaiEP4nDPz4dl81k/Kdhb/CyTyVDhpgGGAeqPHrBEqQwUX7CgTglil2cT8n7PI/EPep68qg5jl10Xlsj2N4EQ59wlXN9Er2CTG0HqEsVO7sA/YVq9x6bvC4fY6RWCv2tYDcLNa6kzU7hoTUUeAMHjxX6VNUZ5yuyjrK/dtEiE6HLV+0XYojMuClsWNYQHnOl+wbhacw0H/ba5yo3WQC2W7SxrUA1sY5S2bTX7v1qy0I0hT2b1B+U0DSzCiDfrua2KyEL1YkScAtSu7kKa4g7mTLZOIHpGe4t8XLa27JwSBWptd9Bx35okr5QunSdTKGiFbiRqfIF5jR3m9gquy5tLdKkmmAEShlnotQ7lNPUvfaJr5hAZKZOUg6ozPoMNhBpBT6yug47BHvlICXUjGr635CJMSQRhISpZ4xSPZC5mCvqVmt8ThiaFaPs3QddrjkYtK+u5xLB9clB0cFK5sBEh0UUhEVttXBTa+VYIyJVQl3BB+ZthRfbEJegmTtD13Y6pOju6fqn9pEbFXbAQqbWz9Rwq22KlCjASze/B7ELgSl+dDR1FoCyoXDz/CkYMHvX/JT6kKEdmEItRmNiidJlzM0t7hKHTxv7AZ4vsBcawj1twEI8GlY7uhuk+JJoUxQ0llMnVGzohfrcenQQUYfVyBH4Qs6e/q2xThOSWAQW6hMH5B2dy5hERRqy9jAfJCAnBVlgAy7hkNi/o0jkjFf6/15Hm9QDU4ENRe2IOzT9d6xxS0Ns/NEf+FcHLoi0t5dD1A/+g88geWH6sKBpQhZLTIWXOko6A9CrxkkqYC0c4xoiEcZzB9lh1yGN34TJi8bwe2rx1RkzKXVH1j7N588pE/0uHMC5x0Z4ADjPIV6bea4kJBa9ZvzRQMzCwNEQ3xG5RPN55n+GxKJPOmOAka8xVliSNI1jHowG+RZFbExnOK0meYJNQEtlw9EgUjVl4bb3KRrJHeyGrU02EHKiDhl3ckxHzvkBmgJ0B7shkDSx+B/KdqexbQMS1lqFCyvADjtCbCBHa6eOqc/vJIhUDO1G9FJV6BpEnaCUUNmY1C41wy4ZFOo+2UGesCnKLYja2JaDCFGH2AJe+0vwsnb+EEXxuwVRGDZZpiSoIHJ7G0XBMrY+LcwicgqiZn4XTlBIioN6o9ywlmCIhB3yl0PPpoouSbnbN7WtaFLWelgijDtN7P1vCJvsT/jejxcLXyeTCr699saysz386ATa1NLoN74hO6xnXU4En9vB/wJPyNIKA5bFwXaD2bZlYhdvfXFwTt58UpnYCusQzsL5zuzMDADWndLmZw94HQwWcMorYRBlFwkjoMLJa/dAZoFQuA19A3SGlZKCSWKO5Svq8bPMbIUHtPrvWHfsw4wXG3ZQqXDtvIUjZ+ErwDVYrhdj0H+3cYcAW+KcAaHtLWZ/D6y9trolIywnms84xPbOCRBwabkpawYsdB9S7jofG5QTS5x7p6miMsHrII71KCRBEcN4jxLE9u7XxTx90CcYmAJS71MMBP/bpL5rkEL3igBOxNTaRJAir3afE0yW0AsywK+8QKoTB6dvFuPSgdrFdQMhsjBnIqHXp0FLnBAg7wWsgPw30/126CRDKsLhJ8oiDR5oX3AMtfra3DXIvWfXBs5dUAJpj1jd8sTGbK1Tp2DtvVuK4e5UlcVYQhOtd+PkCpioacmiOsL7Ko4uIBwU4QncbRKAjKHOu9pgQFEuoBcVL0yQgiSxcyGg445C6tSX0WIXYwB2szF3GKBDGnRvDmSUVa7mgTrNISBqwLTLklmQ7gq7mXNtlcvqQ+AT1M2A71+gCv+AErMTaFokasgV+UjqUAa2FSE6nHF6ItDjDsUz05dX4ADgcpDAJs0JXrxKnzcDHoeCKLvki8lLwjD6OPiaA0j3UPHHyYssuDmb9npIH7d28O5sCC99/Ksrx9gFbAyUzcuZQcZb/14COe0BNJb8B8gcga3XtDjYEvVxpTJGswEhV4t9Uxeb0n/tAVwXf3GAI0yBIDUTmakbkG8QZZDmGdvWiy99ecJO2iiXVJ9MgCWKno7TZIvnlGVXUVxC/BipQYt6bpI8Nv3goTdvfRFCVjrJ5mLWGzAU6pZUNyKHUKJqaGNFpC5iHDXR4a9P7yiEsfp5KbpRfOjcJKheBDWJ6+gL3GAVa8TcuwGDG4Z/VVG3xrEJwmCzaBd/kFMoid4pj6ONZBiahn3phn24EQF0SFI+BFgW7mL8Ek4DBYo4o4Q4ZRLPlGqiKN2nXzRF1fmXogn8E7iJph3GHGY7kE6i+aZexAscCS5dUoYkpsuxtU5PONrmD+WR2s0/aWyQw9rgEQQQhkq/FHfaEzmlEl1KcBtxXJpfOshFsXLtb9MT0TQSa0AC1pia5knivX0dpDzuSDJiLSQ+DQmeYo1j+KFlIdliEXk2N7H4Er+UhFfRh3Q/i+c0izaZ5JuI3ylJwhwNPk8YrTBiamGULPHKJMXuBbWXUXWAxD2NkXyiRNIYsg1QoFDkS82FkPDzLeJO6yLmUNYcSJOJcZXpq3yUaVXHnFhPFI1UkZBiirEB0IX2Sou/iSgMxBhIDToNgZUFKndSbvCyxXg3x9AygRSATYGT8XzvuW7UZzaK9SUJAkQO/6MKPVqUL+RGcYuRZJH41Qp7TiszkQaEao7o98vEcU5p77Oi6EKrzqG1py96xQ0yIU+TeOCuRCJuNcvlPxoAjjHcIA9maCYYEy1HxcLDYJjCpHI6YSxK8Lzl1UjYYPrydBC2yLJQBw4w+8qWFJjMGRroLzuCJ1NcHImu6OCw0ITb0RYoDKg2zTwhC3oWI6bicyPdkejD5W8hhhGvh1BbOoDBBGX6tuKtAfl3jnJQi1vkAVYD7hXRDTvAmUn+h2cwE61E/puElW0x63jXECFJom26QCyT75ipsyiCnfxPXkG2RZZ7hsRbgEJ2tAce4AUs81LkW0nSIieJk9VGEk+ljU84NcHxsXoFiYOOWeVuFccjiR+DDBpI1E0nSdy9Ydyg0d0Uy7auXJxk4r05rBBko99IgkaWHhz1t3BHgTGBJyT+mFuUMa4lxSaWywLqg8xlzZyW60/xGalZmF8ET9Iwr/ovDeaF5OKOKpMrLGlcxfKZtTQOBYVlNWJMKNtqZ44TWpSydEVSqg7ORHrTTpIZLw/6pO6W4+dkdpP+RDWXWNUTX0bSaijfqG35SXJ7wDVF1TmagYqnWryioGd3xKWz//lOv2b3uZYd0IsYa8vJy1Ja0mA8f9dz42UjsUiprTwNJRU/lpZHNS/G21J+tRMzdXUOBF3xs8d0+qFacDXZyC7q4fbps7PsdRlPpgvZhx0eR1xyp8WVMovQ76i6dCdJO9OdqAGWi2klXS5rHLz3F+mqLEl5Pf8Y/ndeV+fJtEoFgf/5fTqzURnrSlUHvy7IZsfT8IuZg+V591byVH6JS+Z2RelJwZSLB5DmvWrTTKezpua9nKvvjatsG98uJ1VdCL/eI1j0emnGe73ieseg4ne8cfQVzrrqO2NVkiSVWG0hS27sHb6d4v5Asqb2z3zmDBMfK8+OFVW9ucuhWY7sLqFTECt8OrT6jfFmP/WK6cbZneX+X7Tym0h3Dbw8t5hlHjXk5cyXjbz0TtatOy733/0QK+w9S0IfzGu53mtAPqk/L4wqABdMS2+4aH9b6BScdDneCUSnjhup66iiKt8ElXRW+0Rlp+T7y7bh1auXkdThlFGWjxahC67mzFb8L57dPhLSt+lZHJ6K916joNQGu9rmsLI0l90E5knjfaXwlb5Xu7hXo11EmOG+k2aVbsEsrSOud6XB86GTc9miF7cqL6e72Be9reejTL7L64KbeURQ4y+tzu8NL1KefblrF9ct4xcntX49ruN+zd8Fn+dNdl0wYd8rJpcVe+VhMo5WHBeoPz5N5tOmLsuyHk33k+fhoL3FrtS9xBPbt2ZUd8py0xzed2e3i9mfnv4HbI/mUae75foAAAAASUVORK5CYII="></a>
					<a id="logo" href="/rooms/list/view"><h4 class="ml-2" style="color:#f52a4f">airbnb</h4></a>
					
				</div>
				
				<div class="input-group col-5">
			  		<input type="text" class="form-control" id="searchInput">
			  		<div class="input-group-append">
			    		<button id="searchBtn" class="btn" type="button" style="background-color:#f52a4f"><i class="bi bi-search text-white"></i></button>
			  		</div>	
				</div>
				
				<%-- 세션에 "userId"라는 키 값이 없다면 로그인이 안된 상태 --%>
				<c:if test="${empty userId}">
				<div id="account" class="dropdown">
					<button class="btn" type="button" id="dropdownMenuButton" data-toggle="dropdown">
						<i class="bi bi-list"></i>
		    			<i class="bi bi-person-circle"></i>
				  	</button>
				  <div class="dropdown-menu dropdown-menu-right">
				    <a class="dropdown-item small" href="/user/signin/email/view">로그인</a>
				    <a class="dropdown-item small" href="/user/signup/view">회원가입</a>
				    <div class="dropdown-divider"></div>
				    <br>
				    <br>
				  </div>
				</div>
				</c:if>
				
				<%-- 세션에 "userId"라는 키 값이 있다면 로그인이 된 상태 --%>
				<c:if test="${not empty userId}">
				<div id="account" class="dropdown">
					<button class="btn" type="button" id="dropdownMenuButton" data-toggle="dropdown">
						<i class="bi bi-list"></i>
		    			<i class="bi bi-person-circle"></i>
				  	</button>
				  <div class="dropdown-menu dropdown-menu-right">
				    <a class="dropdown-item small" href="/mypage/reservation/view">여행</a>
				    <a class="dropdown-item small" href="/mypage/wishlist/view">위시리스트</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item small" href="/host/become_a_host/view">숙소관리</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item small" href="/user/signout">로그아웃</a>
				  </div>
				</div>
				</c:if>
				
			</div>
			<hr>
		</header>
		
		<script>
			$(document).ready(function() {
				
				$("#searchBtn").on("click", function() {
					let searchWord = $("#searchInput").val();
					
					$.ajax({
						type:"get"
						, url:"/room/search"
						, data:{"searchWord":searchWord}
						, success:function(data) {
							
						}
						, error:function() {
							alert("검색 에러");
						}
					})
					
				});
				
			});
		</script>