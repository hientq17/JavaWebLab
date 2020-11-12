<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- include taglib -->
<%@taglib prefix="s" uri="/struts-tags" %>

<div style="border-bottom: 2px dotted">
    <span><s:property value="%{#request.month}"/></span>
</div><br>
<s:iterator var="post" value="%{#request.listPostsByMonth}">
    <div>
        <form action="single-post" method="get">
            <input type="hidden" name="pId" value='${post.getpId()}'>
            <button type="submit" style="border: none">
                <p>${post.getpName()}</p>
            </button>
            <span style="float: right; margin: 2px">
                    ${post.getpLike()}
                    <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>&emsp;
                    ${post.getpView()}
                    <i class="fa fa-eye" aria-hidden="true"></i>&emsp;&emsp;
                    ${post.getpDate()}
             </span>
        </form>
    </div>
</s:iterator>