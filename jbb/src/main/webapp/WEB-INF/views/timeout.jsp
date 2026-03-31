<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<style>
	:root{
		--text:#1f2937;
		--brand:#ff8c00;
		--brand2:#ffb15a;
		--shadow2: 0 10px 24px rgba(17,24,39,.08);
	}

	.session-wrapper {
	    position: static;
	    width: 100%;
	    display: flex;
	    justify-content: center;
	    margin: 0 auto 8px;
	}

	#session-container {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    gap: 10px;
	    width: 100%;
	    background: rgba(255,247,239,.92);
	    color: var(--text);
	    font-size: 13px;
	    font-weight: 700;
	    border: 1px solid rgba(255,140,0,.18);
	    padding: 10px 12px;
	    border-radius: 16px;
	    box-shadow: var(--shadow2);
	    backdrop-filter: blur(10px);
	}

	#extend-session-btn {
	    display: none;
	    background: linear-gradient(135deg, var(--brand), var(--brand2));
	    color: white;
	    border: none;
	    padding: 7px 12px;
	    font-size: 13px;
	    font-weight: 800;
	    border-radius: 10px;
	    cursor: pointer;
	    transition: transform .15s ease, box-shadow .15s ease;
	}

	#extend-session-btn:hover {
	    transform: translateY(-1px);
	    box-shadow: 0 12px 24px rgba(255,140,0,.22);
	}

	#session-timer{
		white-space: nowrap;
	}

	@media (max-width: 720px){
		.session-wrapper{
			margin-bottom: 6px;
		}

		#session-container{
			font-size: 12px;
			padding: 9px 10px;
			gap: 8px;
			flex-wrap: wrap;
		}

		#extend-session-btn{
			font-size: 12px;
			padding: 6px 10px;
		}
	}
</style>

<div class="session-wrapper">
    <div id="session-container">
        <button id="extend-session-btn">연장</button>
        <span id="session-timer"></span>
    </div>
</div>

<script>
let contextPath = "${pageContext.request.contextPath}";

const isAdmin = "<%= session.getAttribute("id") != null && session.getAttribute("id").equals("admin") %>" === "true";
const logoutURL = isAdmin ? contextPath + "/adminlogout" : contextPath + "/user/logout";
const extendURL = isAdmin ? contextPath + "/user/extend-session" : contextPath + "/user/extend-session";

const loginTime = <%= session.getAttribute("loginTime") != null ? "\"" + session.getAttribute("loginTime") + "\"" : "null" %>;

if (loginTime !== null) {
    const sessionDuration = 30 * 60 * 1000;
    let sessionEndTime = parseInt(loginTime) + sessionDuration;
    let alertShown = false;

    const timerEl = document.getElementById("session-timer");
    const extendBtn = document.getElementById("extend-session-btn");

    function updateTimer() {
        const now = new Date().getTime();
        const remaining = sessionEndTime - now;

        if (remaining <= 0) {
            timerEl.textContent = "세션이 만료되었습니다.";
            alert("세션이 만료되어 로그아웃됩니다.");
            location.href = logoutURL;
            return;
        }

        const min = Math.floor(remaining / 60000);
        const sec = Math.floor((remaining % 60000) / 1000);
        timerEl.textContent = "로그아웃까지 " + min + "분 " + sec + "초";

        if (remaining <= 5 * 60 * 1000) {
            extendBtn.style.display = "inline";
        }

        if (remaining <= 60 * 1000 && !alertShown) {
            alert("세션이 1분 뒤 만료됩니다. 연장하지 않으면 자동 로그아웃됩니다.");
            alertShown = true;
        }

        setTimeout(updateTimer, 1000);
    }

    extendBtn.addEventListener("click", () => {
        fetch(extendURL, { method: "POST" })
            .then(res => res.text())
            .then(data => {
                if (data === "ok") {
                    alert("세션이 연장되었습니다.");
                    location.reload();
                }
            });
    });

    updateTimer();
}
</script>