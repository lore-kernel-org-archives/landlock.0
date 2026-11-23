Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395071;
	b=cRH47WPnz/5JSrPDuAmPgyZFso9r3eETOXYMGEMFIgcc3LKV1KF8rUjenKk9HYez36OV
	 ZADlCsaXaJteHqX8Kqyzso8T+WB42YSGovD/AOC6+LdWjKbwNm6BWzldqHBLuJZLoHjMW
	 QoWG46Q8nOBXCmFyV+AIgFNkDyTqA2ZlsNheQUZ0Fe/1K/1n8MVCElwfdrQFh1jcy0OMa
	 gXwlZbJNalNfZdGdS1zj5KlKCp9la/0vjYqqtcoEWTqc9AcIk5TL58nUpUn3Wj0WR6ZJO
	 p6qRRv9eGQkHnaYlv8P2kfgIOEMuc9AjBUnvN78tm6S5F88bOL+uCPZi2wDYZklPrfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395071;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:Date:From:To:X-OQ-MSGID:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ol2lb5fxCjexFvqhzfEV6DvhEakCIkM/eh+4eooMDjk=;
	b=1FesqQh3mEAPbHyVyX2hkv+ENb09RpxqMCGcoqtKTHDsOU6m7l5DEYtyZ3rdAqg/Z+Es
	 EM+McCoU9n8nzFRpL0CGvCJ1V58s3lE3PS/DPlrIk0kzQEG4M4K9AHm1Qw6vZHhEGfjkO
	 8BbUXj/YNVFE9SgoERCgnwTUiuxH6py34HjsDoq5e2K/Y8+xOUASONjk9zfhPxDepRN7g
	 5POk6+RBrpYPlZgk3zoit97rmBUqmZSs+EWpworrqW+UKGL+OYlgoi7NCeUBogaMtiJ3Y
	 /28yxMxgGi8m47AxHpsSHIL1TGAscXJelZmvp0+vk1wW88xnfapqLGtkxVzlLrGVWmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Ekv3LzQk;
	arc=none smtp.remote-ip=43.163.128.55
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.55])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB14606A33B
	for <landlock@lists.linux.dev>; Mon, 23 Nov 2026 00:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB14606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Ekv3LzQk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795395060; bh=ol2lb5fxCjexFvqhzfEV6DvhEakCIkM/eh+4eooMDjk=;
	h=Date:From:To:Subject;
	b=Ekv3LzQkOOB2zlrHpMdJu3I4ExwRrPSw/qgiWs3OsKtgsXv3+Kkh9ZY6MLiv8cw7I
	 iMQoeRZ449d6OPtXnl+RmsDKfy9rw3grM0B2MPf4I6ywokCBAI0NIZHpLU0bGTKh2D
	 +5JV0mlMXbJo38OzAsME7kGE8Zk8ENVxyh6FDDU8=
Received: from ed522b6a8414 ([144.255.82.85])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id CBA8D47D; Mon, 23 Nov 2026 08:50:58 +0800
X-QQ-mid: xmsmtpt1795395058tcuh2pqlh
Message-ID: <tencent_5599D3FAC76821CE19A3B0FAFA3916EB0007@qq.com>
X-QQ-XMAILINFO: OATpkVjS499u18PpHYCyVc5WvAXoV1HjscaY95yUWFu2BTCw9FAxstKG279PDt
	 7f7JOCNG565t674oDgAo0PwsLzr48EsLIt7fRVWlJn+iJt/iR7o+K76cGSQWwp4TajE8kZRYJDP5
	 eU6IOzVmyQr8KwQ5cVA5fufhdXPnXsjOC49pTKcCu5citLq3bKgpFoaFjEjR2y3kVvcPcRYYMDSd
	 9PsQgHQavyb6vSoAqakj6pMI8SrjxYsqoF8AAxBDmyPXvenmbmYoAL3rhXkESzI0MDZ9bh9gDYXi
	 IroQu2c47riwMZAtzSyT6g2XXHA5+hwrZ6b46KJTWIjwhwv4HA15bkwtPnX9QdLHlIfESvJDtFF7
	 sZH0/prQrl0QQWeHMguEk/0/6V87Ak0FI/XzRjO7iKAyQbIJ9zWGIxp6s0/4t6QgB8RCFn1jfYTo
	 XR1fDZ/0vWSzNsE93fYFpm0sX0xlm2iSRuRNSqqeeQwFYsWTe2THypKAoE/Zhb4wVxNXxtCjK7fB
	 6VCT+gjbr15bXzCpezR9s8Y0epTSilXSk4mBCN0ISCc0Yw6l6185+6ielrCeeKZH6jm39TqSXtmX
	 Qe/Qzty8IkOHCn31SNijrTUz+iTyVX3U2PrZnBu3iSeVZbX/0Xgy2/6WzJqEMq6LZDH/aI6lqvdd
	 eVD614knLTMvozvs+pmEKWzn4QgqvqZqJMDsbMOmIWlJZ7D/fXjVklkWklPAEz8aL50wazyIQU6C
	 CuXp+gjyE81nu1VbBZyXACJhciHcMwayr2ep3ZlArxM95pgTG/ZtPTCO42/mlpR1XhK3P2Z78/e6
	 XfdQDiCwO9bhN728KDzdLhKHyEMylX7um6Qu7YHF6IQ4cZ5Gb18z6mCQY4lCSe7MRYy4XqgYa1OG
	 NEVT70LYL+4axXe6NLudYr2nTpqYm0nOlM0GZiXm6ShX0GVdlXuowJRIqUZsaBfUcXznI0pBQq64
	 6+Eb3E3SQWVZJ1+qWXZm8voglfFhiDGMF8HeZz7DeZQwx26sIwyfg8/ZyXnG2hooYf2P2YyMr2sz
	 5BQ3bc/RMsqIwJEc0nZMDZsMl1Q37YVQ+m0pUO3qhfztJ6HZNxyO0mKECZzMM=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
Date: Mon, 23 Nov 2026 08:50:58 +0800 (CST)
From: 2234810978@qq.com
To: landlock@lists.linux.dev
X-OQ-MSGID: <192651008.3696.1795395058374@ed522b6a8414>
Subject: Add multi-language support to go-landlock documentation
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Post: <mailto:landlock@lists.linux.dev>
List-Help: <mailto:landlock+help@lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
List-Owner: <mailto:landlock+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Landlock.

 I noticed that the go-landlock project you maintain has 374 stars on GitHub. It focuses on the field of Linux security sandbox and builds underlying security capabilities for the developer community. Such projects usually require clear technical documentation to reach global users, and multi-language support can effectively lower the barriers to use for non-native Chinese speakers.

 I am translate.js  The author of this MIT-licensed open source JS plug-in can access web pages or README files with one click and automatically translate HTML content, SEO attributes and page elements without changing the original code structure. For open source projects like go-landlock that emphasize readability and dissemination, it can help more international developers understand document content without any barriers.

 if you feel translate.js  It has the potential to help improve the international experience of project documents. You are welcome to try to access it. The project is completely free and can be obtained by searching xnx3/translate on GitHub. If you find it useful, you are sincerely invited to click a star on the project page. This is the greatest support for our continued maintenance.


----------
Email management powered by https://github.com/xnx3/bizbot

