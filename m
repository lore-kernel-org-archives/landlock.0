Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7B07C
	for <landlock@lists.linux.dev>; Mon, 19 Sep 2022 14:44:30 +0000 (UTC)
Date: Mon, 19 Sep 2022 14:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1663598660; x=1663857860;
	bh=FbZfHcpSW9oYZ8bqVllZ2cjFqc93PTwZDtqIvsokp5I=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID;
	b=OLsn+zd1KkAJd6HORyANi+AKY464zk/sf7s8QwpVV4P/4RndNGkca/fq1/pp/L/tw
	 dmn+OsXkKqwbcBKyOZ+QoMt5+BZXCaCot0hLMw/Fsrb+JpYGtpYvyEl7EZ57ovd0mZ
	 isMGOwU3Q1JBodp4GZ/Hx/hEIIwXDAbTI19BSDBijMNXr9m7L2XRrrBXrKfKt723sm
	 egd70g6SEON+xrCcPMw+zfo08pQTfCXu+YP72Care2jUVjO4SRxZVakYguQlii0Q57
	 ZdziHnCBaPoTf+vrQvYKzHdBx0NDsA0F3SwjsLlJyruZatn1pzqPZiyiXuMnur4YeB
	 9iAjaxDxPZm1g==
To: "landlock@lists.linux.dev" <landlock@lists.linux.dev>
From: devnull <devnull771992@proton.me>
Subject: Example code instructions
Message-ID: <-9ppKooZaoDsv4FW6d6Q5iiA4mC4yyqc-i-bNOKZ-Mflu5OXpqP2ZaSw3awBrLxeQPNljs4FDzhYbXxzQ7iSbwnWjBV7Vxjr3VI4qaBNOfA=@proton.me>
Feedback-ID: 53425385:user:proton
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I am trying to figure out how to use landlock to implement into userspace a=
pplications and came across this example code
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/sampl=
es/landlock/sandboxer.c

However, I find myself unable to successfully build the example code

Perhaps this is an obvious issue for any full time C developer, but it woul=
d help increase the use of landlock if there is an example code with step b=
y step instruction on how to actually build it.

So far, any attempt to compile the example "sandboxer.c" (using clang or gc=
c) will result in the following error:

sandboxer.c:163:9: error: =E2=80=98LANDLOCK_ACCESS_FS_REFER=E2=80=99 undecl=
ared (first use in this function)


The affected system is running linux 5.19.8 with landlock enabled.

There may just be a missing compile flag to get it working but I have not f=
ound any documentation about it.
Any hints would be appreciated, thank you
