<!---
	Xindi - http://www.getxindi.com/
	
	Copyright (c) 2012, Simon Bingham
	
	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
	files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, 
	modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software 
	is furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
	OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
	LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
	IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--->

<cfset request.layout = false />

<cfsavecontent variable="local.xml">
	<!--- no space between opening cfoutput tag and start of xml --->
	<cfoutput><?xml version="1.0" encoding="UTF-8"?>
		<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
			<!--- add pages to sitemap --->
			<cfloop array="#rc.pages#" index="local.Page">
				<cfif( rc.sesomitindex )>
					<url><loc>#rc.basehref##local.Page.getSlug()#</loc></url>
				<cfelse>
					<url><loc>#rc.basehref#index.cfm/#local.Page.getSlug()#</loc></url>
				</cfif>
			</cfloop>
			
			<!--- add articles to sitemap --->
			<cfif rc.config.news.enabled> 
				<cfloop array="#rc.articles#" index="local.Article">
					<cfif( rc.sesomitindex )>
						<url><loc>#rc.basehref#news/article/slug/#local.Article.getSlug()#</loc></url>
					<cfelse>
						<url><loc>#rc.basehref#index.cfm/news/article/slug/#local.Article.getSlug()#</loc></url>
					</cfif>
				</cfloop>
			</cfif>
		</urlset>
	</cfoutput>
</cfsavecontent>

<cffile action="write" file="#ExpandPath( "./" )#sitemap.xml" output="#local.xml#">